import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/cart_query_dto.dart';
import 'cart_query_dao.dart';

part 'cart_database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [CartQueryDto])
abstract class CartDatabase extends FloorDatabase {
  CartQueryDao get cartQueryDao;

  static Future<CartDatabase> init () async {
    final database = await $FloorCartDatabase.databaseBuilder('CartQueryDto.db').build();

    print('Database initialized');
    return database;
  }
}
