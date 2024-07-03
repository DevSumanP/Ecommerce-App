import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartModel extends ChangeNotifier {
  List<dynamic> _items = [];
  Future<void> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/images/catalog.json');
    final jsonData = json.decode(jsonString);
    _items = jsonData['products'];
    notifyListeners();
  }

  List<dynamic> get items => _items;
  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;

  bool isLoading = false;

  bool _hasItem = false;
  bool get hasItem => _hasItem;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void addItemToCart(int index) {
    _cartItems.add(_items[index]);
    _hasItem = true; 
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateSubTotal() {
    double subtotalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      subtotalPrice += double.parse(_cartItems[i]['price'].toString());
    }
    return subtotalPrice.toStringAsFixed(2);
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i]['price'].toString());
    }
    totalPrice -= 30.00;
    return totalPrice.toStringAsFixed(2);
  }
}
