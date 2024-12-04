import 'package:floor/floor.dart';

import '../../models/category_dto.dart';


@dao
abstract class CategoriesDao {
  @Query('SELECT * FROM categories')
  Future<List<CategoryDto>> fetchCategories();

  @insert
  Future<void> insertCategories(List<CategoryDto> params);

  @Query('DELETE FROM categories')
  @OnConflictStrategy.replace
  Future<void> deleteAll();
}

