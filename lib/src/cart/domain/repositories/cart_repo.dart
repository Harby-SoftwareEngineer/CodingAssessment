
import '../../data/models/cart_query_dto.dart';
import '../entities/cart_query.dart';


abstract class CartRepo {
  Future<List<CartQuery>>  fetchCartProducts();
  Future<void> insertProduct(CartQueryDto params);
  Future<void> updateProduct(CartQueryDto params);
  Future<void> deleteCallLog(CartQueryDto params);
  Future<void> deleteAll();
}
