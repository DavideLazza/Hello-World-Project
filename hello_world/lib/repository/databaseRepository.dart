import 'package:flutter/material.dart';
import 'package:hello_world/database/database.dart';
import 'package:hello_world/database/entities/exercisestable.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<ExercisesTable>> findAllTodos() async {
    final results = await database.exercisesDao.findAllExercises();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertTodo(ExercisesTable todo) async {
    await database.exercisesDao.insertExercises(todo);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeTodo(ExercisesTable todo) async {
    await database.exercisesDao.deleteExercises(todo);
    notifyListeners();
  } //removeTodo
} //DatabaseRepository
