import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/category_dto.dart';
import 'categories_query_dao.dart';

part 'categories_database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [CategoryDto])
abstract class CategoriesDatabase extends FloorDatabase {
  CategoriesDao get categoriesDao;

  static Future<CategoriesDatabase> init () async {
    final database = await $FloorCategoriesDatabase.databaseBuilder('CategoriesDao.db').build();
    return database;
  }
}
