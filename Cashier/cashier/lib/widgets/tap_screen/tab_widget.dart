import 'package:client_order/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  final Function setState;

  const TabScreen({required this.setState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => setState(1),
          child: Text('Table Screen'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<OrderProvider>(context, listen: false).getSummaryToday();
            setState(2);
            },
          child: Text('Summary Screen'),
        ),
      ],
    );
  }
}
