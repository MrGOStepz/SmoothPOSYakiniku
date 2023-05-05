import 'package:flutter/material.dart';

import '../models/product_model.dart';

class OrderItemWidget extends StatefulWidget {
  final List<Product> product;
  final int orderDetailId;
  final int popupDetailId;
  final int quantity;

  const OrderItemWidget(
      { required this.product,
        required this.orderDetailId,
      required this.popupDetailId,
      required this.quantity,
      Key? key})
      : super(key: key);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  int _quantity = 0;

  void _addItemNumber(int value) {
    setState(() {
      if (_quantity > 0) {
        _quantity = _quantity + value;
        // Provider.of<OrderProvider>(context, listen: false)
        // .addOrRemoveItem(widget.id, value);
        //     .addOrRemoveItem(widget.id, widget.popupDetailId, value);
      }
    });
  }

  String _getTitle() {
    String name = widget.product.firstWhere((element) => element.id == widget.orderDetailId).name;
    return name;
  }

  String _getNoodleType() {
    String noodleType;
    if(widget.popupDetailId == 1) {
      noodleType = 'อุด้ง';
    } else if(widget.popupDetailId == 2) {
      noodleType = 'อุงด้งเส้นแบน';
    } else if(widget.popupDetailId == 3) {
      noodleType = 'ราเมง';
    }else {
      noodleType = '';
    }
    return noodleType;
  }

  @override
  Widget build(BuildContext context) {
    _quantity = widget.quantity;
    return Container(
      color: Colors.grey,
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: ListTile(
                title: Text(_getTitle()),
                subtitle: Text(_getNoodleType()),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => _addItemNumber(-1),
                  child: const Text("-"),
                ),
                Text(_quantity.toString()),
                TextButton(
                  onPressed: () => _addItemNumber(1),
                  child: const Text("+"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
