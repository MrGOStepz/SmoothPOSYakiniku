import 'package:flutter/material.dart';

import '../models/table_detail.dart';
import 'head_column.dart';
import 'order_list.dart';

class ListChecker extends StatelessWidget {
  final AppBar appBar;
  final TableDetail tableDetail;

  const ListChecker({required this.appBar, required this.tableDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(children: [
      HeadColumn(appBar: appBar, tableDetail: tableDetail),
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.9,
        child: OrderList(orders: tableDetail.items),
      )
    ]);
  }
}
