import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/carts_provider.dart';

class SendOrder extends StatefulWidget {
  const SendOrder({Key? key}) : super(key: key);

  @override
  State<SendOrder> createState() => _SendOrderState();
}

class _SendOrderState extends State<SendOrder> {

  void _sendOrder() {
    setState(() {
      Provider.of<Cart>(context, listen: false).sendOrderToBackEnd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _sendOrder,
      child: const Text("Send"),
    );
  }
}
