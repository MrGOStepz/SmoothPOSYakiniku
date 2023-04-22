import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/carts_provider.dart';

class CartSection extends StatefulWidget {
  const CartSection(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.quantity})
      : super(key: key);

  final int id;
  final String title;
  final String description;
  final double price;
  final int quantity;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  int _quantity = 0;

  void _addItemNumber(int value) {
    setState(() {
      if (_quantity > 0) {
        _quantity = _quantity + value;
        Provider.of<Cart>(context, listen: false)
            .addOrRemoveItem(widget.id, value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _quantity = widget.quantity;
    return Container(
      color: Colors.grey,
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('${widget.title.toString()}  ${widget.quantity}'),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => _addItemNumber(-1),
                  child: const Text("-"),
                ),
                Text(_quantity.toString()),
                TextButton(
                  onPressed: () => _addItemNumber(1),
                  child: const Text("+"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
