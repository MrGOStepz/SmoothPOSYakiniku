import 'dart:convert';

import 'package:client_order/models/requests/order_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/cart_item_model.dart';
import '../services/web_socket.dart';
import 'config_provider.dart';

class Cart with ChangeNotifier {
  // Map<String, CartItem> _items = { '1': CartItem(id: '1', title: 'Test1', price: 20, quantity: 1), '2': CartItem(id: '2', title: 'Title2', price: 10, quantity: 1)};
  final Map<int, CartItem> _items = {};

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

  void addItem(int productId, double price, String title, String description,
      String comment) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              name: existingCartItem.name,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              comment: existingCartItem.comment));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            productId: productId,
            name: title,
            description: description,
            price: price,
            quantity: 1,
            comment: comment),
      );
    }
    notifyListeners();
  }

  void removeItem(int? productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void addOrRemoveItem(int productId, int value) {
    if (!_items.containsKey(productId)) {
      return;
    }

    var quantity = _items[productId]?.quantity as int;
    quantity = quantity + value;
    if (quantity > 0) {
      items.update(
          productId,
          (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              name: existingCartItem.name,
              description: existingCartItem.description,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + value,
              comment: existingCartItem.comment));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void sendToWebSocket(CartRequest cartRequest) {
    var stompClient = stompClient2;
    if (stompClient == null) {
      stompClient.activate();
      debugPrint("STOMP= NULL");
    } else {
      debugPrint("STOMP!= NULL");
    }

    stompClient.activate();
    var request = jsonEncode(cartRequest.toJson());
    stompClient.send(
      destination: '/app/order',
      body: request,
    );
  }

  void sendOrder() {
    //TODO Send to Backend
    List<CartItem> cartItems = [];
    _items.forEach((key, value) {
      cartItems.add(value);
    });

    CartRequest cartRequest = CartRequest(POSConfig.tableId, cartItems);
    sendToWebSocket(cartRequest);

    _items.clear();
    notifyListeners();
  }

  Future<void> sendOrderToBackEnd() async {
    final url = Uri.http('localhost:8080', '/api/v1/order/order');
    List<CartItem> cartItems = [];
    _items.forEach((key, value) {
      cartItems.add(value);
    });

    CartRequest cartRequest = CartRequest(POSConfig.tableId, cartItems);
    try {
      final response = await http.post(
        url,
        body: json.encode(cartRequest),
      );
      _items.clear();
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
