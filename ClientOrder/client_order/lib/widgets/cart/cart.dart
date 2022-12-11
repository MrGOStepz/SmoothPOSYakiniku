import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: ListView.builder(
          itemCount: cart.itemCount,
          itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id,
              title: cart.items.values.toList()[i].title,
              price: price,
              quantity: quantity)),
    );
  }
}
