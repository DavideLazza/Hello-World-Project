import 'package:floor/floor.dart';
import 'package:hello_world/database/entities/exercise.dart';

@dao
abstract class ExerciseDao {
  @Query('SELECT * FROM Exercise')
  Future<List<Exercise>> findAllExercises();

  @Query('SELECT COUNT(name) FROM Exercise')
  Future<int?> getExercisesCount();

  @Query('SELECT SUM(cal) FROM Exercise')
  Future<int?> getTotalCalories();

  @Query('SELECT SUM(dist) FROM Exercise')
  Future<double?> getTotalKm();

  @insert
  Future<void> insertExercises(Exercise exercise);

  @Query('DELETE FROM Exercise')
  Future<void> deleteExercises();
}
