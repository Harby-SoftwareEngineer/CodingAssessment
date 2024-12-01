
import 'package:injectable/injectable.dart';
 import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/categories_datasource.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImp extends CategoriesRepo{
  final CategoriesDatasource  datasource;
  CategoriesRepoImp(this.datasource);

  @override
  Future<List<Category>> fetchCategories() async{
    final response = await datasource.fetchCategories();
    return Category.fromDtoList(response);
  }

}