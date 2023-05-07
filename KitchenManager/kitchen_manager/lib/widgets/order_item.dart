import 'package:flutter/material.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:provider/provider.dart';

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
      textItemStyle =  TextStyle(decoration: TextDecoration.lineThrough);
      widget.cartItem.isNew = false;
    });
  }

  String _generateName(){
   return '${widget.cartItem.name}  x ${widget.cartItem.quantity}';
  }

  String _getNoodleType() {
    String noodleType = '';
    if(widget.cartItem.popupDetailId == 1) {
      noodleType = 'อุด้ง';
    } else if (widget.cartItem.popupDetailId == 2) {
      noodleType = 'อุงด้ง แบน';
    } else if (widget.cartItem.popupDetailId == 3) {
      noodleType = 'ราเมง';
    }
    return noodleType;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.cartItem.isNew) {
      textItemStyle = const TextStyle(
        decoration: TextDecoration.none,
      );
    }
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        title: Text(
          _generateName(),
          style: textItemStyle,
        ),
        subtitle: Text(_getNoodleType(),
        style: TextStyle(
          color: Colors.red,
          fontSize: 15
        ),),
        trailing: IconButton(
          icon: const Icon(Icons.check),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => changeTextItemStyle(),
        ),
      ),
    );
  }
}
