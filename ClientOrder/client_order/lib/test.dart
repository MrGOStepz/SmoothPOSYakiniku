import 'package:flutter/material.dart';

import 'providers/carts_provider.dart';

void main() => runApp(TestApp());

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    Map<int, CartItem> _items = {};
    List<CartItem> cartItem = [
      CartItem(id: 1, title: "Test1", price: 14.5, quantity: 3),
      CartItem(id: 2, title: "Test2", price: 2.5, quantity: 3)
    ];
    _items[1] = CartItem(id: 1, title: "Test1", price: 14.5, quantity: 3);
    _items[2] = CartItem(id: 2, title: "Test2", price: 14.5, quantity: 3);

    _items[5] = CartItem(id: 333, title: "Test333", price: 14.5, quantity: 3);
    debugPrint(_items.values.toList()[0].title);
    debugPrint(_items.values.toList()[1].title);
    debugPrint(_items.values.toList()[2].title);
    debugPrint(_items[5]?.title.toString());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: Text("Test"),
      ),
    );
  }
}
