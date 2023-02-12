import 'package:flutter/material.dart';

import 'models/product_model.dart';

void main() => runApp(TestApp());

enum SingingCharacter { lafayette, jefferson }

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  SingingCharacter? _character = SingingCharacter.jefferson;
  int _quantity = 1;
  int _riceId = 1;
  int _mealId = 1;

  _updateQuantity(int value) {
    setState(() {
      _quantity = _quantity + value;
    });
  }

  _updateRiceId(int productId, bool isMeal) {
    setState(() {
      if (isMeal) {
        _riceId = productId;
      } else {
        _mealId = productId;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _mealId = 1;
    _riceId = 1;
  }

  List<Widget>? generateRadio(List<Product> productItems, bool isMeal) {
    List<Widget> widgets = [];
    String meal = isMeal ? "Meal" : "Rice";
    for (Product productItem in productItems) {
      widgets.add(
        ListTile(
          title: Text(productItem.name),
          leading: Radio(
              value: productItem.id,
              groupValue: meal,
              onChanged: _updateRiceId(productItem.id, isMeal)),
        ),
      );
    }
    return widgets;
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
                      child: Column(
                        children: [
                          Text("Rice"),
                          // ...generateRadio(productItems, isMeal),
                          // ListTile(
                          //   title: const Text('Lafayette'),
                          //   leading: Radio<SingingCharacter>(
                          //     value: SingingCharacter.lafayette,
                          //     groupValue: _character,
                          //     onChanged: (SingingCharacter? value) {
                          //       setState(() {
                          //         _character = value;
                          //       });
                          //     },
                          //   ),
                          // ),
                          // ListTile(
                          //   title: const Text('Jefferson'),
                          //   leading: Radio<SingingCharacter>(
                          //     value: SingingCharacter.jefferson,
                          //     groupValue: _character,
                          //     onChanged: (SingingCharacter? value) {
                          //       setState(() {
                          //         _character = value;
                          //       });
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Beef"),
                          ListTile(
                            title: const Text('Lafayette'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.jefferson,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
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
