import 'package:flutter/material.dart';

import '../models/table_item_model.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  final TableItem tableItem;

  const OrderList({required this.tableItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tableItem.items.length,
      itemBuilder: (ctx, index) => OrderItem(
        cartItem: tableItem.items[index],
      ),
    );
  }
}
