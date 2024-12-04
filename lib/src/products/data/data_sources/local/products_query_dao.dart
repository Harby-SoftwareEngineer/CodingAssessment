import 'package:app/src/products/data/models/product_query_dto.dart';
import 'package:floor/floor.dart';


@dao
abstract class ProductsDao {
  @Query('SELECT * FROM products')
  Future<List<ProductQueryDto>> fetchProducts();

  @insert
  Future<void> insertProducts(List<ProductQueryDto> params);

  @Query('DELETE FROM products')
  Future<void> deleteAll();
}

