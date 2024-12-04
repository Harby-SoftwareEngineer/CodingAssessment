
import 'dart:convert';

import 'package:app/src/categories/data/models/category_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/seasons_repo.dart';
import '../data_sources/local/products_database.dart';
import '../data_sources/remote/products_datasource.dart';
import '../models/product_dto.dart';
import '../models/product_query_dto.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImp extends ProductsRepo{
  final ProductsDatasource  datasource;
  final ProductsDatabase  db;
  ProductsRepoImp(this.datasource, this.db);

  @override
  Future<List<Product>> fetchProducts() async {
    List<ProductDto> dtoList = [];
    bool result = await InternetConnection().hasInternetAccess;
    if(result){
      dtoList = await fetchProductsFromRemote();
      await insertCategory(dtoList);
      return Product.fromDtoList(dtoList);
    }
    dtoList = await fetchProductsFromLocal();
    return Product.fromDtoList(dtoList);
  }

  Future<void> insertCategory(List<ProductDto> category) async {
    List<ProductQueryDto> queryDtoList = [];
    for (var item in category) {
      queryDtoList.add(ProductQueryDto(
        id: item.id,
        title: item.title,
        price: item.price,
        category: jsonEncode(item.category?.toJson()),
        images: jsonEncode(item.images),
      ));
    }
    await db.productsDao.deleteAll();
    await db.productsDao.insertProducts(queryDtoList);
  }

  Future<List<ProductDto>> fetchProductsFromLocal() async {
    final data = await db.productsDao.fetchProducts();
    List<ProductDto> dtoList = [];
    for (var item in data) {
      CategoryDto categoryDto = CategoryDto.fromJson(jsonDecode(item.category!));
      List<dynamic> images = jsonDecode(item.images!);
      List<String> imagesList = images.map((e) => e.toString()).toList();
      dtoList.add(ProductDto(
        id: item.id,
        title: item.title,
        price: item.price,
        category: categoryDto,
        images: imagesList,
      ));
    }
    return dtoList;
  }

  Future<List<ProductDto>> fetchProductsFromRemote() async {
    return await datasource.fetchProducts();
  }
}
