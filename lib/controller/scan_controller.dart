import 'package:flutter/material.dart';

class ScanController with ChangeNotifier {
  int _scanCount = 0;

  int get scanCount => _scanCount;

  void increment() {
    _scanCount++;
    notifyListeners();
  }
}
