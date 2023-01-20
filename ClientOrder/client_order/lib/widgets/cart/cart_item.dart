import 'package:flutter/material.dart';

class CartSection extends StatefulWidget {
  const CartSection(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.quantity})
      : super(key: key);

  final int? id;
  final String? title;
  final double? price;
  final int? quantity;

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  //TODO Create Button for Increase and Decrease
  int _countItem = 0;

  void addItemNumber() {
    setState(() {
      _countItem++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: ListTile(
            title: Text(widget.title as String),
            subtitle: Text(widget.quantity.toString()),
            trailing: Column(children: [
              TextButton(onPressed: null, child: Text("+", style: TextStyle(fontSize: 10))),
              Text(_countItem.toString()),
              TextButton(onPressed: null, child: Text("-", style: TextStyle(fontSize: 10)))
            ],)
            // IconButton(
            //   icon: Icon(Icons.expand_less),
            //   onPressed: addItemNumber,
            // ),
          )),
    );
  }
}
