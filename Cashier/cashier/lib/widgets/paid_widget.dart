import 'package:client_order/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaidWidget extends StatefulWidget {
  const PaidWidget({Key? key}) : super(key: key);

  @override
  State<PaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<PaidWidget> {
  void _updateOrderPaid() {
   setState(() {
     Provider.of<OrderProvider>(context, listen: false).updateStatus();
   });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextButton(
        onPressed: _updateOrderPaid,
        child: Text('PAID'),
      ),
    );
  }
}
