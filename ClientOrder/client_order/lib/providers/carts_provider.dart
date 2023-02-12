import 'package:flutter/foundation.dart';

class CartItem {
  final int id;
  final String title;
  final String description;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  // Map<String, CartItem> _items = { '1': CartItem(id: '1', title: 'Test1', price: 20, quantity: 1), '2': CartItem(id: '2', title: 'Title2', price: 10, quantity: 1)};
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
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

  void addItem(int productId, double price, String title, String description) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(id: productId, title: title, description: description, price: price, quantity: 1),
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
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + value));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
