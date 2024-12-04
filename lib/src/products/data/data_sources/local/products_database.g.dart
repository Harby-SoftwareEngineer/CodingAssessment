// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProductsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductsDatabaseBuilder databaseBuilder(String name) =>
      _$ProductsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ProductsDatabaseBuilder(null);
}

class _$ProductsDatabaseBuilder {
  _$ProductsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProductsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProductsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProductsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProductsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProductsDatabase extends ProductsDatabase {
  _$ProductsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductsDao? _productsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `products` (`id` INTEGER, `title` TEXT, `price` INTEGER, `description` TEXT, `images` TEXT, `creationAt` TEXT, `updatedAt` TEXT, `category` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductsDao get productsDao {
    return _productsDaoInstance ??= _$ProductsDao(database, changeListener);
  }
}

class _$ProductsDao extends ProductsDao {
  _$ProductsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productQueryDtoInsertionAdapter = InsertionAdapter(
            database,
            'products',
            (ProductQueryDto item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'description': item.description,
                  'images': item.images,
                  'creationAt': item.creationAt,
                  'updatedAt': item.updatedAt,
                  'category': item.category
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductQueryDto> _productQueryDtoInsertionAdapter;

  @override
  Future<List<ProductQueryDto>> fetchProducts() async {
    return _queryAdapter.queryList('SELECT * FROM products',
        mapper: (Map<String, Object?> row) => ProductQueryDto(
            id: row['id'] as int?,
            title: row['title'] as String?,
            price: row['price'] as int?,
            description: row['description'] as String?,
            images: row['images'] as String?,
            creationAt: row['creationAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            category: row['category'] as String?));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM products');
  }

  @override
  Future<void> insertProducts(List<ProductQueryDto> params) async {
    await _productQueryDtoInsertionAdapter.insertList(
        params, OnConflictStrategy.abort);
  }
}
