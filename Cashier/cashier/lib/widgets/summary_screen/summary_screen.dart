import 'package:client_order/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen:true);
    return SizedBox(
      width: double.infinity,
      child: Text(
        orderProvider.getSummaryText
      ),
    );
  }
}
