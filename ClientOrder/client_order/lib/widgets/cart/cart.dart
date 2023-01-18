import 'package:client_order/providers/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartMenu extends StatelessWidget {
  const CartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    debugPrint("ITEM QUANTITY ${cart.Titems[1]?.quantity}");
    if (cart.itemCount == 0) {
      return Text("EMPTY");
    } else {
      return Consumer<Cart>(
          builder: (ctx, cartS, _) => ListView.builder(
              itemCount: cartS.itemCount,
              itemBuilder: (ctx, i) => CartSection(
                  id: cartS.Titems.values.toList()[i].id,
                  title: cartS.Titems.values.toList()[i].title,
                  price: cartS.Titems.values.toList()[i].price,
                  quantity: cartS.Titems.values.toList()[i].quantity)));
    }
  }
}
