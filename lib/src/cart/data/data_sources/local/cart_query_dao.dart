import 'package:app/src/products/domain/entities/product.dart';
import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';

import '../../../../products/data/models/product_dto.dart';
import '../../models/cart_query_dto.dart';


@dao
abstract class CartQueryDao {
  @Query('SELECT * FROM CartQueryDto')
  Future<List<CartQueryDto>> fetchCartQuery();

  @insert
  Future<void> insertProduct(CartQueryDto params);

  @delete
  Future<void> deleteCallLog(CartQueryDto params);

  @Query('DELETE FROM CartQueryDto')
  Future<void> deleteAll();
}

