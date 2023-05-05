import 'package:client_order/providers/order_provider.dart';
import 'package:client_order/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class OrderScreen extends StatefulWidget {
  final List<Product> productList;

  OrderScreen({required this.productList, Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String listItem = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (ctx, order, _) => ListView.builder(
          itemCount: order.orderDetailItemLength,
          itemBuilder: (ctx, i) => OrderItemWidget(
              product: widget.productList,
              orderDetailId: order.orderDetailItems[i].orderDetailId,
              popupDetailId: order.orderDetailItems[i].popupDetailId,
              quantity: order.orderDetailItems[i].quantity)),
      // builder: (ctx, order, _) => Text(
      //   order.getOrderDetailText(productList),
      //   style: TextStyle(fontSize: 20),
      // ),
    );
  }
}
