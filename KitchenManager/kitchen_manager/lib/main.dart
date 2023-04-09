import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_item_model.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:kitchen_manager/screens/main_screen.dart';
import 'package:kitchen_manager/screens/overview_screen.dart';
import 'package:kitchen_manager/services/product_service.dart';
import 'package:kitchen_manager/widgets/list_checker.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const KitchenManager());
}

class KitchenManager extends StatelessWidget {
  const KitchenManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TableProvider()),
      ],
      child: const MaterialApp(
          title: 'Kitchen Manager',
          home: KitchenOverviewScreen(title: 'Kitchen')),
    );
  }
}