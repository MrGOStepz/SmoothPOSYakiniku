import 'dart:convert';

import 'package:client_order/models/requests/order_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/cart_item_model.dart';
import '../services/web_socket.dart';

class Cart with ChangeNotifier {
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

  void addItem(int productId, int popupDetailId, double price, String title, String description,
      String comment) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              popupDetailId: existingCartItem.popupDetailId,
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
            popupDetailId: popupDetailId,
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
              popupDetailId: existingCartItem.popupDetailId,
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

  void sendToWebSocket(String tableName) {
    List<CartItem> cartItems = [];
    _items.forEach((key, value) {
      cartItems.add(value);
    });
    CartRequest cartRequest = CartRequest(tableName, cartItems);

    var request = jsonEncode(cartRequest.toJson());
    stompClient.send(
      destination: '/app/cart/order',
      body: request,
    );
    items.clear();
    notifyListeners();
  }

// Future<void> sendOrderToBackEnd() async {
//   final url = Uri.http(GlobalConfiguration().get("server_endpoint"), '/api/v1/order/order');
//   // final url = Uri.http('10.0.2.2:8080', '/api/v1/order/order');
//   // final url = Uri.http('localhost:8080', '/api/v1/order/order');
//   // final url = Uri.http('127.0.0.1:8080', '/api/v1/order/order');
//   List<CartItem> cartItems = [];
//   _items.forEach((key, value) {
//     cartItems.add(value);
//   });
//
//   CartRequest cartRequest = CartRequest(POSConfig.tableName, cartItems);
//   try {
//     final response = await http.post(
//       url,
//       body: json.encode(cartRequest),
//     );
//     _items.clear();
//     notifyListeners();
//   } catch (error) {
//     print(error);
//     throw error;
//   }
// }
}
