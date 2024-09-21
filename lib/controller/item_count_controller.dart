import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_oreo/model/product_model.dart';

class ItemCountController with ChangeNotifier {
  final countBox = Hive.box<Product>('countBox');
  List keys = [];
  Future<void> addToCart({
    required int id,
    String? imageUrl,
    String? name,
    String? quantity,
    String? batchNo,
    int? count = 1,
    BuildContext? context, //to show snackbar
  }) async {
    bool alreadyInCart = false;
    //to check whether the item already in cart
    for (int i = 0; i < keys.length; i++) {
      var itemInHive = countBox.get(keys[i]);
      if (itemInHive?.id == id) {
        alreadyInCart = true;
      }
    }
    if (alreadyInCart == false) {
      await countBox.add(
        Product(
            batchNo: batchNo!,
            id: id,
            count: count!,
            imageUrl: imageUrl!,
            name: name!,
            quantity: quantity!),
      );
    } else {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text('Item Already Added')));
    }
    notifyListeners();
  }

  getAllCartItems() {
    keys = countBox.keys.toList();
    notifyListeners();
  }

//for getting the current item
  Product? getCurrentItem(var key) {
    final currentItem = countBox.get(key);
    return currentItem;
  }

  incrementQty(var key) {
    final currentItem = countBox.get(key);
    countBox.put(
        key,
        Product(
          batchNo: currentItem!.batchNo,
          count: ++currentItem!.count,
          id: currentItem!.id,
          imageUrl: currentItem!.imageUrl,
          name: currentItem!.name,
          quantity: currentItem!.quantity,
        ));
    notifyListeners();
  }

  decrementQty(var key) {
    final currentItem = countBox.get(key);
    if (currentItem!.count >= 2) {
      countBox.put(
          key,
          Product(
            batchNo: currentItem!.batchNo,
            count: --currentItem!.count,
            id: currentItem!.id,
            imageUrl: currentItem!.imageUrl,
            name: currentItem!.name,
            quantity: currentItem!.quantity,
          ));
    }
    notifyListeners();
  }
}
