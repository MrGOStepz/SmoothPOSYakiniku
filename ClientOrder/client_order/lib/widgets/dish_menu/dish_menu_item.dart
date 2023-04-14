import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/carts_provider.dart';

class ProductMenuItem extends StatefulWidget {
  final int id;
  final String name;
  final double price;
  final String imagePath;

  const ProductMenuItem(
      {Key? key, required this.id, required this.name, required this.price, required this.imagePath})
      : super(key: key);

  @override
  State<ProductMenuItem> createState() => _ProductMenuItemState();
}

class _ProductMenuItemState extends State<ProductMenuItem> {
  late String valueText;
  late String codeDialog;
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('TextField in Dialog'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                valueText = value;
              });
            },
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Text Field in Dialog"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  codeDialog = valueText;
                  Navigator.pop(context);
                });
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: true);
    return InkWell(
      //Add Description
      onTap: () {
        // _displayTextInputDialog(context);
        cart.addItem(widget.id, widget.price, widget.name, '', '');
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange.withOpacity(0.7),
              Colors.deepOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          widget.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
