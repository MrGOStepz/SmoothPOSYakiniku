import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    debugPrint("ITEM QUANTITY ${cartProvider.items[1]?.quantity}");
    if (cartProvider.itemCount == 0) {
      return Text("EMPTY");
    } else {
      return Consumer<Cart>(
        builder: (ctx, cart, _) => ListView.builder(
          itemCount: cart.itemCount,
          itemBuilder: (ctx, i) => CartSection(
            id: cart.items.values.toList()[i].id,
            title: cart.items.values.toList()[i].title,
            description: cart.items.values.toList()[i].description,
            price: cart.items.values.toList()[i].price,
            quantity: cart.items.values.toList()[i].quantity,
          ),
        ),
      );
    }
  }
}
