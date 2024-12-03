
import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/seasons_repo.dart';
import '../data_sources/remote/products_datasource.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImp extends ProductsRepo{
  final ProductsDatasource  datasource;
  ProductsRepoImp(this.datasource);

  @override
  Future<List<Product>> fetchProducts() async {
    final res =  await datasource.fetchProducts();
    return Product.fromDtoList(res);
  }

}