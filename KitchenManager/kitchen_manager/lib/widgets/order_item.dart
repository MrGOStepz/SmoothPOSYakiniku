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

  String _generateName(){
    String noodleType = '';
    if(widget.cartItem.popupDetailId == 1) {
   noodleType = 'อุด้ง';
   } else if (widget.cartItem.popupDetailId == 2) {
    noodleType = 'อุงด้ง แบน';
    } else if (widget.cartItem.popupDetailId == 3) {
      noodleType = 'ราเมง';
    }

   return '${widget.cartItem.name} $noodleType x ${widget.cartItem.quantity}';
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
          _generateName(),
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
