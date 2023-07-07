import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/exercisesDao.dart';
import 'entities/exercisestable.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ExercisesTable])
abstract class AppDatabase extends FloorDatabase {
  ExercisesDao get exercisesDao;
}
