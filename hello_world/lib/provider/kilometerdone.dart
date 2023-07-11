import 'package:flutter/material.dart';

class KilometerDone with ChangeNotifier {
  int kmDone = 0;

  void setKmDone(int a) {
    kmDone = a;
    notifyListeners();
  }
}
