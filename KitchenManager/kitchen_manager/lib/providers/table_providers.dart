import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/cart_item_model.dart';

import '../models/table_detail.dart';

class TableProvider with ChangeNotifier {
  List<TableItem> tableItems = [
    TableItem(0, "Waiting Order", "PENDING", []),
    TableItem(0, "Waiting Order", "PENDING", []),
    TableItem(0, "Waiting Order", "PENDING", [])
  ];

  List<TableItem> initMock() {
    List<TableItem> tempTable = [];
    tempTable.add(TableItem(1, "2", "Cook", [
      CartItem(1, "Beef 50", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(2, "3", "Cook", [
      CartItem(1, "Beef 60", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(3, "4", "Cook", [
      CartItem(1, "Beef 70", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(4, "5", "Cook", [
      CartItem(1, "Beef 70", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(5, "6", "Cook", [
      CartItem(1, "Beef 80", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    return tempTable;
  }

  List<TableItem> get items {
    return tableItems;
  }

  String tempTableName = '1';

  void addTempItem() {
    tempTableName += tempTableName;
    tableItems.add(TableItem(
        3, tempTableName, 'Cook', [CartItem(2, "Beef 100", "", 50.0, 1, "")]));
  }

  Future<void> fetchAndSetTableDetail() async {
    try {
      List<TableItem> tempItem = initMock();
      // addItem(tempItem);
      initTableItem(tempItem);
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void initTableItem(List<TableItem> listTableItem) {
    if (listTableItem.length > 3) {
      for (int i = 0; i < listTableItem.length; i++) {
        if (i < 3) {
          tableItems[i] = listTableItem[i];
        }
        tableItems.add(listTableItem[i]);
      }
    } else {
      for (int i = 0; i < listTableItem.length; i++) {
        tableItems[i] = listTableItem[i];
      }
    }
  }

  void addItem(TableItem tableItem) {
    List<TableItem> temp =
        tableItems.where((value) => value.tableName == 'FREE').toList();
    if (tableItems[0].orderInfoId == 0) {
      tableItems[0] = tableItem;
    } else if (tableItems[1].orderInfoId == 0) {
      tableItems[1] = tableItem;
    } else if (tableItems[2].orderInfoId == 0) {
      tableItems[2] = tableItem;
    } else {
      tableItems.add(tableItem);
    }
  }

  void cleanTable(int index) {
    debugPrint('Clear index = ${index}');
    if (tableItems.length > 3) {
      tableItems.removeAt(index);
    } else {
      tableItems.add(TableItem(0, "Waiting Order", "PENDING", []));
    }
    notifyListeners();
  }
}
