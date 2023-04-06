import 'package:flutter/material.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:provider/provider.dart';

import '../models/table_detail.dart';
import '../widgets/list_checker.dart';

class MainScreen extends StatefulWidget {
  final AppBar appBar;

  const MainScreen({required this.appBar, Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TableItem> tableItems = [];

  @override
  Widget build(BuildContext context) {
    final tableProvider = Provider.of<TableProvider>(context, listen: false);
    tableItems = tableProvider.items;
    return Table(border: TableBorder.all(), children: [
      TableRow(
        children: [
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 0,
            tableItem: tableItems[0],
          ),
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 1,
            tableItem: tableItems[1],
          ),
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 2,
            tableItem: tableItems[2],
          ),
          Text('Table 4') // TODO Clean List,
        ],
      ),
    ]);
  }
}
