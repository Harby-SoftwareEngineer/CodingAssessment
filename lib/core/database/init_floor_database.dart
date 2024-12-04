import 'package:app/src/products/data/data_sources/local/products_database.dart';

import '../../src/cart/data/data_sources/local/cart_database.dart';
import '../../src/categories/data/data_sources/local/categories_database.dart';
import '../di/injector.dart';

class InitFloorDatabase {
  static Future<void> init() async {
    injector.registerSingleton(await CartDatabase.init());
    injector.registerSingleton(await CategoriesDatabase.init());
    injector.registerSingleton(await ProductsDatabase.init());
  }

}