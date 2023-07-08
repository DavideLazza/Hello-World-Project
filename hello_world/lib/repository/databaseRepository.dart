import 'package:flutter/material.dart';
import 'package:hello_world/database/database.dart';
import 'package:hello_world/database/entities/exercise.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Exercise>> findAllExercises() async {
    final results = await database.exerciseDao.findAllExercises();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertExercises(Exercise x) async {
    await database.exerciseDao.insertExercises(x);
    notifyListeners();
  } //insertTodo

  Future<void> deleteExercises() async {
    await database.exerciseDao.deleteExercises();
    notifyListeners();
  }
} //DatabaseRepository
