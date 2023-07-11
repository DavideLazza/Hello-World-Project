import 'package:flutter/material.dart';

class KilometerGoal with ChangeNotifier {
  int km = 0;

  void setKm(int a) {
    km = a;
    notifyListeners();
  }
}
