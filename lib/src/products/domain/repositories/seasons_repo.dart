
import '../entities/product.dart';


abstract class ProductsRepo {
  Future<List<Product>>  fetchProducts();
}
