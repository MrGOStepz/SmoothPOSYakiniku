import 'package:flutter/material.dart';

import '../models/order_item_detail.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  final List<OrderItemDetail> orders;

  const OrderList({required this.orders, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: orders
          .map((item) =>
              OrderItem(key: ValueKey(item.id), orderItemDetail: item))
          .toList(),
    );
  }
}
