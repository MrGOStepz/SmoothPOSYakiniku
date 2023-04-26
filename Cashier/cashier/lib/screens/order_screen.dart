import 'package:client_order/providers/order_provider.dart';
import 'package:client_order/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order_detail_modal.dart';
import '../models/product_model.dart';

class OrderScreen extends StatelessWidget {
  final List<Product> productList;
  OrderScreen({required this.productList, Key? key}) : super(key: key);

  String listItem = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (ctx, order, _) => Text(order.getOrderDetailText(productList)),
    );
  }
}
