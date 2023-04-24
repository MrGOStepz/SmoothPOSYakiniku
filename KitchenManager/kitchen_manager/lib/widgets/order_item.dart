import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';

class OrderItem extends StatefulWidget {
  final CartItem cartItem;

  const OrderItem({required this.cartItem, Key? key}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  TextStyle textItemStyle = const TextStyle(
    decoration: TextDecoration.none,
  );

  void changeTextItemStyle() {
    setState(() {
      textItemStyle = const TextStyle(decoration: TextDecoration.lineThrough);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: double.infinity,
    //     child: ListTile(
    //     title: Text(
    //       '${widget.cartItem.name} x ${widget.cartItem.quantity}',
    //       style: textItemStyle,
    //     ),
    //     trailing: IconButton(
    //       icon: const Icon(Icons.check),
    //       onPressed: () => changeTextItemStyle(),
    //     ),
    //   ),
    // );
  // }
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        title: Text(
          '${widget.cartItem.name} ',
          style: textItemStyle,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.check),
          color: Theme.of(context).errorColor,
          onPressed: () => changeTextItemStyle(),
        ),
      ),
    );
  }
}
