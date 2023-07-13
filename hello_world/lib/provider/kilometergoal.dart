import 'package:flutter/material.dart';

class KilometerGoal with ChangeNotifier {
  int kmGoal = 0;

  void setKm(int a) {
    kmGoal = a;
    notifyListeners();
  }
}
