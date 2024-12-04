
import 'package:app/src/categories/data/models/category_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
 import '../../../products/data/data_sources/local/products_database.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/local/categories_database.dart';
import '../data_sources/remote/categories_datasource.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImp extends CategoriesRepo{
  final CategoriesDatasource  datasource;
  final CategoriesDatabase  db;
  CategoriesRepoImp(this.datasource, this.db);

  @override
  Future<List<Category>> fetchCategories() async{
    List<CategoryDto> dtoList = [];
    bool result = await InternetConnection().hasInternetAccess;
    if(result){
      dtoList = await fetchCategoriesFromRemote();
      await insertCategory(dtoList);
      return Category.fromDtoList(dtoList);
    }
    dtoList = await fetchCategoriesFromLocal();
    return Category.fromDtoList(dtoList);
  }

  Future<void> insertCategory(List<CategoryDto> category) async {
    await db.categoriesDao.deleteAll();
    await db.categoriesDao.insertCategories(category);
  }

  Future<List<CategoryDto>> fetchCategoriesFromLocal() async {
    return await db.categoriesDao.fetchCategories();
  }

  Future<List<CategoryDto>> fetchCategoriesFromRemote() async {
    return await datasource.fetchCategories();
  }
}