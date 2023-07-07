// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  ExercisesDao? _exercisesDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `ExercisesTable` (`dist` INTEGER PRIMARY KEY AUTOINCREMENT, `activity` TEXT NOT NULL, `cal` INTEGER NOT NULL, `distunit` TEXT NOT NULL, `date` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ExercisesDao get exercisesDao {
    return _exercisesDaoInstance ??= _$ExercisesDao(database, changeListener);
  }
}

class _$ExercisesDao extends ExercisesDao {
  _$ExercisesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _exercisesTableInsertionAdapter = InsertionAdapter(
            database,
            'ExercisesTable',
            (ExercisesTable item) => <String, Object?>{
                  'dist': item.dist,
                  'activity': item.activity,
                  'cal': item.cal,
                  'distunit': item.distunit,
                  'date': item.date
                }),
        _exercisesTableDeletionAdapter = DeletionAdapter(
            database,
            'ExercisesTable',
            ['dist'],
            (ExercisesTable item) => <String, Object?>{
                  'dist': item.dist,
                  'activity': item.activity,
                  'cal': item.cal,
                  'distunit': item.distunit,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExercisesTable> _exercisesTableInsertionAdapter;

  final DeletionAdapter<ExercisesTable> _exercisesTableDeletionAdapter;

  @override
  Future<List<ExercisesTable>> findAllExercises() async {
    return _queryAdapter.queryList('SELECT * FROM ExercisesTable',
        mapper: (Map<String, Object?> row) => ExercisesTable(
            row['dist'] as int?,
            row['activity'] as String,
            row['cal'] as int,
            row['distunit'] as String,
            row['date'] as String));
  }

  @override
  Future<void> insertExercises(ExercisesTable exercise) async {
    await _exercisesTableInsertionAdapter.insert(
        exercise, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExercises(ExercisesTable task) async {
    await _exercisesTableDeletionAdapter.delete(task);
  }
}
