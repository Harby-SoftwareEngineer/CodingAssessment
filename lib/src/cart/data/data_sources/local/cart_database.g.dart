// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorCartDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CartDatabaseBuilder databaseBuilder(String name) =>
      _$CartDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CartDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$CartDatabaseBuilder(null);
}

class _$CartDatabaseBuilder {
  _$CartDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$CartDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CartDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CartDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CartDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CartDatabase extends CartDatabase {
  _$CartDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartQueryDao? _cartQueryDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `CartQueryDto` (`id` INTEGER, `title` TEXT, `price` INTEGER, `quantity` INTEGER, `image` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartQueryDao get cartQueryDao {
    return _cartQueryDaoInstance ??= _$CartQueryDao(database, changeListener);
  }
}

class _$CartQueryDao extends CartQueryDao {
  _$CartQueryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartQueryDtoInsertionAdapter = InsertionAdapter(
            database,
            'CartQueryDto',
            (CartQueryDto item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                }),
        _cartQueryDtoUpdateAdapter = UpdateAdapter(
            database,
            'CartQueryDto',
            ['id'],
            (CartQueryDto item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                }),
        _cartQueryDtoDeletionAdapter = DeletionAdapter(
            database,
            'CartQueryDto',
            ['id'],
            (CartQueryDto item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartQueryDto> _cartQueryDtoInsertionAdapter;

  final UpdateAdapter<CartQueryDto> _cartQueryDtoUpdateAdapter;

  final DeletionAdapter<CartQueryDto> _cartQueryDtoDeletionAdapter;

  @override
  Future<List<CartQueryDto>> fetchCartQuery() async {
    return _queryAdapter.queryList('SELECT * FROM CartQueryDto',
        mapper: (Map<String, Object?> row) => CartQueryDto(
            id: row['id'] as int?,
            title: row['title'] as String?,
            price: row['price'] as int?,
            quantity: row['quantity'] as int?,
            image: row['image'] as String?));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CartQueryDto');
  }

  @override
  Future<void> insertProduct(CartQueryDto params) async {
    await _cartQueryDtoInsertionAdapter.insert(
        params, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(CartQueryDto params) async {
    await _cartQueryDtoUpdateAdapter.update(params, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCallLog(CartQueryDto params) async {
    await _cartQueryDtoDeletionAdapter.delete(params);
  }
}
