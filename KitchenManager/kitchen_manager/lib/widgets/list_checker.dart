import 'package:flutter/material.dart';

import '../models/table_item_model.dart';
import 'head_column.dart';
import 'order_list.dart';

class ListChecker extends StatefulWidget {
  final AppBar appBar;
  final TableItem tableItem;
  final int columnNumber;

  const ListChecker({
    required this.appBar,
    required this.tableItem,
    required this.columnNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<ListChecker> createState() => _ListCheckerState();
}

class _ListCheckerState extends State<ListChecker> {
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
          tableItem: widget.tableItem,
          columnNumber: widget.columnNumber,
        ),
        SizedBox(
          height: heightSize,
          child: OrderList(tableItem: widget.tableItem),
        )
      ],
    );
  }
}
