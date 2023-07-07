import 'package:floor/floor.dart';

@entity
class ExercisesTable {
  @PrimaryKey(autoGenerate: true)
  final int? dist;

  final String activity;
  final int cal;
  final String distunit;
  final String date;

  ExercisesTable(this.dist, this.activity, this.cal, this.distunit, this.date);
}
