import 'package:flutter/material.dart';

void main() => runApp(TestApp());

enum SingingCharacter { lafayette, jefferson }

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
          padding: const EdgeInsets.all(30),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text("Name"),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Rice"),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text("Beef"),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Confirm"),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text("Cancel"),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
