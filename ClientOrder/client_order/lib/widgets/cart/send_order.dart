import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/carts_provider.dart';

class SendOrder extends StatefulWidget {
final TextEditingController titleController;
  const SendOrder({required this.titleController, Key? key}) : super(key: key);

  @override
  State<SendOrder> createState() => _SendOrderState();
}

class _SendOrderState extends State<SendOrder> {
  void _sendOrder() {
    setState(() {
      Provider.of<Cart>(context, listen: false).sendToWebSocket(widget.titleController.text);
      widget.titleController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Confirm Order'),
          content: const Text('ถ้ากด Send แล้ว จะไม่สามารถยกเลิกได้'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Send');
                _sendOrder();
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
      child: const Text("Send"),
    );
  }
}
