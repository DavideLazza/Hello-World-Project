import 'package:floor/floor.dart';
import 'package:hello_world/database/entities/exercise.dart';

@dao
abstract class ExerciseDao {
  @Query('SELECT * FROM Exercise')
  Future<List<Exercise>> findAllExercises();

  @insert
  Future<void> insertExercises(Exercise exercise);

  @Query('DELETE FROM Exercise')
  Future<void> deleteExercises();
}
