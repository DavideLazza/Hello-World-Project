class Exercise {
  final String? activityName;
  final int? calories;
  final double? distance;
  final String? distanceUnit;
  final String? date;

  Exercise(
      {required this.activityName,
      required this.calories,
      required this.distance,
      required this.distanceUnit,
      required this.date});

  @override
  String toString() {
    return 'attività: $activityName, calories: $calories, distance: $distance, distanceUnit: $distanceUnit, date: $date';
  }
}
