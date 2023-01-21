import 'package:flutter/material.dart';

import 'providers/carts_provider.dart';

void main() => runApp(TestApp());

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  int _quantity = 1;

  void _updateQuantity(int value) {
    setState(() {
      _quantity = _quantity + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: Container(
          color: Colors.grey,
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Text("Title"),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    TextButton(onPressed:() => _updateQuantity(-1), child: Text("-")),
                    Text(_quantity.toString()),
                    TextButton(onPressed:() => _updateQuantity(1), child: Text("+"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
