import 'package:floor/floor.dart';

import '../../models/category_dto.dart';


@dao
abstract class CategoriesDao {
  @Query('SELECT * FROM CategoriesDao')
  Future<List<CategoryDto>> fetchCartQuery();

  @insert
  Future<void> insertProduct(List<CategoryDto> params);

  @Query('DELETE FROM CartQueryDto')
  Future<void> deleteAll();
}

