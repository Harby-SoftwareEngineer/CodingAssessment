
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
 import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repo.dart';
import '../data_sources/remote/categories_datasource.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImp extends CategoriesRepo{
  final CategoriesDatasource  datasource;
  CategoriesRepoImp(this.datasource);

  @override
  Future<List<Category>> fetchCategories() async{
    final response = await datasource.fetchCategories();
    final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
        // The internet is now connected
          break;
        case InternetStatus.disconnected:
        // The internet is now disconnected
          break;
      }
    });
    return Category.fromDtoList(response);
  }


}