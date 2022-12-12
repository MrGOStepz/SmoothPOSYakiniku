import 'package:client_order/providers/carts_provider.dart';
import 'package:client_order/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/categories_provider.dart';
import 'providers/products_provider.dart';
import 'screens/overview_screen.dart';

void main() => runApp(ClientOrderApp());

class ClientOrderApp extends StatelessWidget {
  const ClientOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Categories(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          )
        ],
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
          ),
          home: const OrderOverViewScreen(),
          // routes: {
          // MenuScreen.routeName: (ctx) => MenuScreen(),
          //   CartScreen.routeName: (ctx) => CartScreen(),
          //   OrdersScreen.routeName: (ctx) => OrdersScreen(),
          //   UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          //   EditProductScreen.routeName: (ctx) => EditProductScreen(),
          // }),
        ));
  }
}
