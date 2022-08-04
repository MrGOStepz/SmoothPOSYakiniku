import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/table_detail.dart';

class ItemsChecker extends StatelessWidget {
  final AppBar appBar;
  final TableDetail tableDetail;
  // final Function(String) deleteItem;
  const ItemsChecker({required this.appBar,required this.tableDetail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemDetail> items = tableDetail.items;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            title: Text(items[index] as String),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => null,
            ),
          ),
        );
      },
    );
  }
}
