import 'package:flutter/material.dart';

import '../models/table_item_model.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  final TableItem tableItem;

  const OrderList({required this.tableItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tableItem.items
          .map((item) =>
              OrderItem(key: ValueKey(tableItem.orderInfoId), cartItem: item))
          .toList(),
    );
  }
}
