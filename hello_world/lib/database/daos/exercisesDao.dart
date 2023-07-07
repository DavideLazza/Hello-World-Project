// ignore_for_file: camel_case_types

import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:hello_world/database/entities/exercisestable.dart';

@dao
abstract class ExercisesDao {
  @Query('SELECT * FROM ExercisesTable')
  Future<List<ExercisesTable>> findAllExercises();

  @insert
  Future<void> insertExercises(ExercisesTable exercise);

  @delete
  Future<void> deleteExercises(ExercisesTable task);
}
