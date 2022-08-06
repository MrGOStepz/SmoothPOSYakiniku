import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';

class OrderItem extends StatefulWidget {
  final OrderItemDetail orderItemDetail;

  const OrderItem({required this.orderItemDetail, Key? key}) : super(key: key);

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
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        title: Text(
          widget.orderItemDetail.name,
          style: textItemStyle,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => changeTextItemStyle(),
        ),
      ),
    );
  }
}
