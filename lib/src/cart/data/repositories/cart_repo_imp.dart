
import 'package:injectable/injectable.dart';
import '../../domain/entities/cart_query.dart';
import '../../domain/repositories/cart_repo.dart';
import '../data_sources/local/cart_query_dao.dart';
import '../data_sources/local/init_floor_database.dart';
import '../models/cart_query_dto.dart';

@Injectable(as: CartRepo)
class CartRepoImp extends CartRepo{
  final InitFloorDatabase  db;
  CartRepoImp(this.db);

  @override
  Future<void> deleteAll() async {
    await db.cartQueryDao.deleteAll();
  }

  @override
  Future<void> deleteCallLog(CartQueryDto params) async {
    await db.cartQueryDao.deleteCallLog(params);
  }

  @override
  Future<List<CartQuery>> fetchCartProducts() async {
    // InitFloorDatabase db = await InitFloorDatabase.init();
    final List<CartQueryDto> cartQueryDto = await db.cartQueryDao.fetchCartQuery();
    return CartQuery.fromDtoList(cartQueryDto);
  }

  @override
  Future<void> insertProduct(CartQueryDto params) async {
    await db.cartQueryDao.insertProduct(params);
  }

  @override
  Future<void> updateProduct(CartQueryDto params) async {
    await db.cartQueryDao.updateProduct(params);
  }

}