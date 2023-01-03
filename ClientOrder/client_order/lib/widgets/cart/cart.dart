import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    // List<CartItem> carts = cart.items as List<CartItem>;
    Size size = MediaQuery.of(context).size;
    CartItem ca = CartItem(id: 1, title: "TEST1", price: 2, quantity: 1);
    Map<int, CartItem> temp1 = {};
    temp1[1] = ca;
    debugPrint(temp1[2]?.title.toString());
    if (cart.itemCount == 0) {
      return Text("EMPTY");
    } else {
      return Consumer<Cart>(
          // builder: (ctx, carts, _) => ,
          // builder: (ctx, cartS, _) => Text(cartS.itemCount.toString()));
          builder: (ctx, cartS, _) => ListView.builder(
              itemCount: cartS.itemCount,
              // itemBuilder: (ctx, i) => Text(cartS.items.values.toString())));
              // itemBuilder: (ctx, i) => Text(cartS.items.values.toList()[i].title.toString())));
              itemBuilder: (ctx, i) => CartSection(
                    id: cartS.items[i]?.id,
                    title: cartS.items[i]?.title,
                    price: cartS.items[i]?.price,
                    quantity: cartS.items[i]?.quantity,
                  )));
      // id: cart.items.values.toList()[i].id,
      // title: cart.items.values.toList()[i].title,
      // price: cart.items.values.toList()[i].price,
      // quantity: cart.items.values.toList()[i].quantity)));
    }
    // return Container(
    //   width: double.infinity,
    //   height: size.height,
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         width: double.infinity,
    //         height: size.height * 0.1,
    //         child: Text("Top Panel"),
    //       ),
    // Consumer<Cart>(
    //     builder: (ctx, cart, _) => ListView.builder(
    //         itemCount: cart.itemCount,
    //         itemBuilder: (ctx, i) =>
    //             Text('${cart.items.values.toList()[i].id}')))
    // itemBuilder: (ctx, i) => CartSection(
    //     // id: cart.items.values.toList()[i].id,
    //     // title: cart.items.values.toList()[i].title,
    //     // price: cart.items.values.toList()[i].price,
    //     // quantity: cart.items.values.toList()[i].quantity)))
    // Container(
    //     width: double.infinity,
    //     height: size.height * 0.9,
    //     // Expanded(
    //     child: ListView.builder(
    //         itemCount: cart.itemCount,
    //         itemBuilder: (ctx, i) => CartSection(
    //             id: cart.items.values.toList()[i].id,
    //             title: cart.items.values.toList()[i].title,
    //             price: cart.items.values.toList()[i].price,
    //             quantity: cart.items.values.toList()[i].quantity)))
    // ],
    // ),
    // );
  }
}
