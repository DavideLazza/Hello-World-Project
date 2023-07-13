import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@entity
class Exercise {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id;

  //For the sake of simplicity, a Todo has only a name.
  final String? name;
  final int? cal;
  final double? dist;
  final String? unit;
  final int? avgHR;
  final double? speed;
  final double? duration;
  final String? date;

  //Default constructor
  Exercise(this.id, this.name, this.cal, this.dist, this.unit, this.avgHR,
      this.speed, this.duration, this.date);
}
