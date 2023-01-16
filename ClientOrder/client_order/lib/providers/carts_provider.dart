import 'dart:ui';

import 'package:client_order/models/product_model.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final int id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  // Map<String, CartItem> _items = { '1': CartItem(id: '1', title: 'Test1', price: 20, quantity: 1), '2': CartItem(id: '2', title: 'Title2', price: 10, quantity: 1)};
  Map<int, CartItem> _items = {};
  List<CartItem> cartItem = [CartItem(id: 1, title: "Test1", price: 14.5, quantity: 3), CartItem(id: 2, title: "Test2", price: 2.5, quantity: 3)];

  Map<int, CartItem> get items {
    return {...items};
  }

  Map<int, CartItem> get Titems {
    return _items;
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(int productId, double price, String title) {
    debugPrint("ProductID = ${productId.toString()}");
    debugPrint(_items.toString());
    if (_items.containsKey(productId)) {
      debugPrint("Quantity Same Key ${_items[productId]?.quantity.toString()}");
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(id: productId, title: title, price: price, quantity: 1),
      );
     debugPrint("Quantity ${_items[productId]?.quantity.toString()}");

    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void addOrRemoveItem(int productId, int value) {
    if (!_items.containsKey(productId)) {
      return;
    }

    var quantity = _items[productId]?.quantity as int;
    quantity = quantity + value;
    if (quantity > 1) {
      items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + value));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
