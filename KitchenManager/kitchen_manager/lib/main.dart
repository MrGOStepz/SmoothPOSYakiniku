import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:kitchen_manager/screens/overview_screen.dart';
import 'package:provider/provider.dart';

import 'config/add_setting.dart';

void main() {
  GlobalConfiguration().loadFromMap(appSettings);
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
