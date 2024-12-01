
import '../entities/category.dart';

abstract class CategoriesRepo {
  Future<List<Category>>  fetchCategories();
}
