import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/view/dummydb.dart';

class ScanController with ChangeNotifier {
  int _scanCount = 0;
  List<ProductModel> scannedItems =
      []; // to store the currently added item to the the cart for creating a bag

  int get scanCount => _scanCount;

  void increment() {
    _scanCount++;
    notifyListeners();
  }

  void addScannedItemToBag(int itemId) {
    scannedItems.add(Dummydb.products.firstWhere((e) => itemId == e.id));
    log(scannedItems.length.toString());
    notifyListeners();
  }
}
