import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: true);
    // List<CartItem> carts = cart.items as List<CartItem>;
    Size size = MediaQuery.of(context).size;
    debugPrint("ITEM QUANTITY ${cart.Titems[1]?.quantity}");
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
                  //   id: cartS.items[i]?.id,
                  //   title: cartS.items[i]?.title,
                  //   price: cartS.items[i]?.price,
                  //   quantity: cartS.items[i]?.quantity,
                  // )));
                  id: cartS.Titems.values.toList()[i].id,
                  title: cartS.Titems.values.toList()[i].title,
                  price: cartS.Titems.values.toList()[i].price,
                  quantity: cartS.Titems.values.toList()[i].quantity)
          ));
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
