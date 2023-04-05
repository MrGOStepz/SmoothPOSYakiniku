import 'package:flutter/material.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:provider/provider.dart';

import '../models/table_detail.dart';
import 'head_column.dart';
import 'order_list.dart';

class ListChecker extends StatefulWidget {
  final AppBar appBar;
  final TableItem tableItem;
  final int columnNumber;

  const ListChecker({
    required this.appBar,
    required this.columnNumber,
    required this.tableItem,
    Key? key,
  }) : super(key: key);

  @override
  State<ListChecker> createState() => _ListCheckerState();
}

class _ListCheckerState extends State<ListChecker> {
  TableItem _tableItem = TableItem(0, 'EMPTY', 'FREE', []);

  void getNextTable() {
    setState(() {
      _tableItem =
          Provider.of<TableProvider>(context, listen: false).popTableDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double heightSize = (mediaQuery.size.height -
            widget.appBar.preferredSize.height -
            mediaQuery.padding.top) *
        0.9;
    return Column(
      children: [
        HeadColumnTable(
          appBar: widget.appBar,
          tableItem: _tableItem,
          columnNumber: widget.columnNumber,
          getNextOrder: getNextTable,
        ),
        Container(
          height: heightSize,
          child: OrderList(tableItem: _tableItem),
        )
      ],
    );
  }
}
