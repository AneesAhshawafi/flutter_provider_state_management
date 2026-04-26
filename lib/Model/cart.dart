import 'package:flutter/material.dart';
import 'item.dart';

class Cart with ChangeNotifier {
  List<Item> items = [];
  double get totalPrice => items.fold(0, (total, item) => total + item.price);
  int get itemCount => items.length;
  addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  List<Item> getItems() {
    return items;
  }
  delete(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
