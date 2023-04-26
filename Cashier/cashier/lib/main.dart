import 'package:client_order/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

import 'config/app_settings.dart';
import 'providers/order_provider.dart';
import 'screens/over_view_screen.dart';

void main() {
  GlobalConfiguration().loadFromMap(appSettings);
  runApp(const CashierApp());
}

class CashierApp extends StatelessWidget {
  const CashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: OrderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: const OverViewScreen(),
      ),
    );
  }
}
