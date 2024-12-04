import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/product_query_dto.dart';
import 'products_query_dao.dart';

part 'products_database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [ProductQueryDto])
abstract class ProductsDatabase extends FloorDatabase {
  ProductsDao get productsDao;

  static Future<ProductsDatabase> init () async {
    final database = await $FloorProductsDatabase.databaseBuilder('ProductsDao.db').build();

    print('Database initialized');
    return database;
  }
}
