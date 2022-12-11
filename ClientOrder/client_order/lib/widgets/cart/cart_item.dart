import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: const [
          ListTile(
            title: Text("Cart"),
            subtitle: Text("Sub title test"),
            trailing: IconButton(
              icon: Icon(Icons.expand_less),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }
}
