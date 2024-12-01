import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/cart_query_dto.dart';
import 'cart_query_dao.dart';

part 'init_floor_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CartQueryDto])
abstract class InitFloorDatabase extends FloorDatabase {
  CartQueryDao get cartQueryDao;

  static Future<InitFloorDatabase> init () async {
    final database = await $FloorInitFloorDatabase.databaseBuilder('CartQueryDto.db').build();

    print('Database initialized');
    return database;
  }
}
