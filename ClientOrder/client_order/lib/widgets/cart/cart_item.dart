import 'package:flutter/material.dart';

class CartSection extends StatefulWidget {
  const CartSection(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity})
      : super(key: key);

  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final int? quantity;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  int _countItem = 0;

  void _addItemNumber(int value) {
    setState(() {
      _countItem = _countItem + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                TextButton(
                  onPressed: () => _addItemNumber(-1),
                  child: Text("-"),
                ),
                Text(_countItem.toString()),
                TextButton(
                  onPressed: () => _addItemNumber(1),
                  child: Text("+"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
