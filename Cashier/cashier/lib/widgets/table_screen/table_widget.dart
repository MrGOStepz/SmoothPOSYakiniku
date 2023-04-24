import 'package:flutter/material.dart';

import 'table_item_widget.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TableItemWidget> listTableItems = [];
    for(int i=1; i<= 20; i++) {
     TableItemWidget tableItemWidget = TableItemWidget(tableName: i.toString());
     listTableItems.add(tableItemWidget);
    }
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...listTableItems,
      ],
    );
  }
}
