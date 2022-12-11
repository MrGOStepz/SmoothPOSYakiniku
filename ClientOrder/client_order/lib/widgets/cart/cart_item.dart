import 'package:flutter/material.dart';

class CartSection extends StatefulWidget {
  const CartSection(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.quantity})
      : super(key: key);

  final String id;
  final String title;
  final double price;
  final int quantity;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  //TODO Create Button for Increase and Decrease
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.title),
            trailing: IconButton(
              icon: Icon(Icons.expand_less),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }
}
