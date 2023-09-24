// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GameeDao? _gameDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `game` (`id` INTEGER, `slug` TEXT, `name` TEXT, `released` TEXT, `tba` INTEGER, `backgroundImage` TEXT, `rating` REAL, `ratingTop` REAL, `platforms` TEXT NOT NULL, `parentPlatforms` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GameeDao get gameDao {
    return _gameDaoInstance ??= _$GameeDao(database, changeListener);
  }
}

class _$GameeDao extends GameeDao {
  _$GameeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gameEntityInsertionAdapter = InsertionAdapter(
            database,
            'game',
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'slug': item.slug,
                  'name': item.name,
                  'released': item.released,
                  'tba': item.tba == null ? null : (item.tba! ? 1 : 0),
                  'backgroundImage': item.backgroundImage,
                  'rating': item.rating,
                  'ratingTop': item.ratingTop,
                  'platforms': _platformsEntityConverter.encode(item.platforms),
                  'parentPlatforms': _parentPlatformsEntityConverter
                      .encode(item.parentPlatforms)
                }),
        _gameEntityDeletionAdapter = DeletionAdapter(
            database,
            'game',
            ['id'],
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'slug': item.slug,
                  'name': item.name,
                  'released': item.released,
                  'tba': item.tba == null ? null : (item.tba! ? 1 : 0),
                  'backgroundImage': item.backgroundImage,
                  'rating': item.rating,
                  'ratingTop': item.ratingTop,
                  'platforms': _platformsEntityConverter.encode(item.platforms),
                  'parentPlatforms': _parentPlatformsEntityConverter
                      .encode(item.parentPlatforms)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameEntity> _gameEntityInsertionAdapter;

  final DeletionAdapter<GameEntity> _gameEntityDeletionAdapter;

  @override
  Future<List<GameEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM game',
        mapper: (Map<String, Object?> row) => GameEntity(
            id: row['id'] as int?,
            slug: row['slug'] as String?,
            name: row['name'] as String?,
            released: row['released'] as String?,
            tba: row['tba'] == null ? null : (row['tba'] as int) != 0,
            backgroundImage: row['backgroundImage'] as String?,
            rating: row['rating'] as double?,
            ratingTop: row['ratingTop'] as double?,
            platforms:
                _platformsEntityConverter.decode(row['platforms'] as String),
            parentPlatforms: _parentPlatformsEntityConverter
                .decode(row['parentPlatforms'] as String)));
  }

  @override
  Future<void> insertGame(GameEntity game) async {
    await _gameEntityInsertionAdapter.insert(game, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGame(GameEntity game) async {
    await _gameEntityDeletionAdapter.delete(game);
  }
}

// ignore_for_file: unused_element
final _platformsEntityConverter = PlatformsEntityConverter();
final _platformEntityConverter = PlatformEntityConverter();
final _parentPlatformsEntityConverter = ParentPlatformsEntityConverter();
final _parentPlatformEntityConverter = ParentPlatformEntityConverter();
