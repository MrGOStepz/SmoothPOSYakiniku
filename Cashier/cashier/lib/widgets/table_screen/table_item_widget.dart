import 'package:client_order/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableItemWidget extends StatefulWidget {
  final String tableName;
  final String status;

  const TableItemWidget({required this.tableName, required this.status, Key? key}) : super(key: key);

  @override
  State<TableItemWidget> createState() => _TableItemWidgetState();
}

class _TableItemWidgetState extends State<TableItemWidget> {
  void _getOrderInfo(){
    Provider.of<OrderProvider>(context, listen: false).sendOrderToBackEnd(widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    Color colorStatus = Colors.green;
    if(widget.status == "Cook") {
      colorStatus = Colors.yellow;
    } else if(widget.status == "Done") {
      colorStatus = Colors.blue;
    }

    return InkWell(
      onTap: _getOrderInfo,
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(color: colorStatus),
          child: Center(
            child: Text(
              widget.tableName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
