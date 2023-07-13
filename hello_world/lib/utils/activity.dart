class Activity {
  final String? activityName;
  final int? calories;
  final double? distance;
  final String? distanceUnit;
  final int avgHR;
  final double? speed;
  final double? duration;
  final String? date;

  Activity(
      {required this.activityName,
      required this.calories,
      required this.distance,
      required this.distanceUnit,
      required this.avgHR,
      required this.speed,
      required this.duration,
      required this.date});

  @override
  String toString() {
    return 'activityName: $activityName, calories: $calories, distance: $distance, distanceUnit: $distanceUnit, avgHR: $avgHR, speed: $speed, activeDuration: $duration, date: $date';
  }
}
