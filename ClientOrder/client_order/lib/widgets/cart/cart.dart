import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    // List<CartItem> carts = cart.items as List<CartItem>;
    // debugPrint(cart.itemCount.toString());
    Size size = MediaQuery.of(context).size;
    debugPrint(size.height.toString());
    return Container(
      width: double.infinity,
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.1,
            child: Text("Top Panel"),
          ),
          Container(
              width: double.infinity,
              height: size.height * 0.9,
              // Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (ctx, i) => CartSection(
                      id: cart.items.values.toList()[i].id,
                      productId: cart.items.keys.toList()[i],
                      title: cart.items.values.toList()[i].title,
                      price: cart.items.values.toList()[i].price,
                      quantity: cart.items.values.toList()[i].quantity)))
        ],
      ),
    );
  }
}
