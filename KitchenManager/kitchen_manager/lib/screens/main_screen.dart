import 'package:flutter/material.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:provider/provider.dart';

import '../models/table_detail.dart';
import '../widgets/list_checker.dart';

class MainScreen extends StatefulWidget {
  final AppBar appBar;

  const MainScreen({required this.appBar, Key? key}): super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _isInit = true;
  List<TableItem> tableItems = [];

  void getTableItem() {
    setState(() {
      tableItems = Provider.of<TableProvider>(context, listen: false).tableItems;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //   setState(() {
      //     _isLoading = true;
      //   });
      //   Provider.of<Products>(context).fetchAndSetProducts().then((_) {
      //     setState(() {
      //       _isLoading = false;
      //     });
      //   });

      Provider.of<TableProvider>(context).fetchAndSetTableDetail();
      tableItems = Provider.of<TableProvider>(context).items;
      debugPrint(tableItems.toString());
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Table Size ${tableItems.length}');
    debugPrint('TableItem 0: ${tableItems[0].orderInfoId}');
    debugPrint('TableItem 1: ${tableItems[1].orderInfoId}');
    debugPrint('TableItem 2: ${tableItems[2].orderInfoId}');
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
