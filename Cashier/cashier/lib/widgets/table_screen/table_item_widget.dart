import 'package:client_order/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableItemWidget extends StatefulWidget {
  final String tableName;

  const TableItemWidget({required this.tableName, Key? key}) : super(key: key);

  @override
  State<TableItemWidget> createState() => _TableItemWidgetState();
}

class _TableItemWidgetState extends State<TableItemWidget> {
  void _getOrderInfo(){
    Provider.of<OrderProvider>(context, listen: false).sendOrderToBackEnd(widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _getOrderInfo,
      child: SizedBox(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.blue),
          child: Text(
            widget.tableName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
