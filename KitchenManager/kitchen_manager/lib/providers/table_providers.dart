import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/cart_item_model.dart';

import '../models/table_info_model.dart';
import '../models/table_item_model.dart';

class TableProvider with ChangeNotifier {
  List<TableItem> tableItems = [
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", []),
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", []),
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", [])
  ];
  TableItem vacantTable =
      TableItem(0, TableInfo(0, 'Waiter Table'), "PENDING", []);

  Future<List<TableItem>> initMock() async {
    List<TableItem> tempTable = [];
    tempTable.add(TableItem(1, TableInfo(1, '1'), "Cook", [
      CartItem(1, "Beef 50", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(2, TableInfo(2,'2'), "Cook", [
      CartItem(1, "Beef 60", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(3, "3", "Cook", [
      CartItem(1, "Beef 70", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(4, "4", "Cook", [
      CartItem(1, "Beef 70", "", 50.0, 1, ""),
      CartItem(2, "Beef 100", "", 50.0, 1, "")
    ]));
    tempTable.add(TableItem(5, "5", "Cook", [
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
    addItem(TableItem(
        1, tempTableName, 'Cook', [CartItem(2, "Beef 100", "", 50.0, 1, "")]));
  }

  Future<void> fetchAndSetTableDetail() async {
    try {
      List<TableItem> tempItem = await initMock();
      await initTableItem(tempItem);
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> initTableItem(List<TableItem> listTableItem) async {
    if (listTableItem.length > 3) {
      for (int i = 0; i < listTableItem.length; i++) {
        if (i < 3) {
          tableItems[i] = listTableItem[i];
        } else {
          tableItems.add(listTableItem[i]);
        }
      }
    } else {
      for (int i = listTableItem.length - 1; i >= 0; i--) {
        tableItems[i] = listTableItem[i];
      }
    }
  }

  void addItem(TableItem tableItem) {
    List<TableItem> tempItem =
        tableItems.where((value) => value.orderInfoId == 0).toList();

    debugPrint('Current Length: ${tempItem.length}');
    if (tempItem.length == 3) {
      tableItems[0] = tableItem;
    } else if (tempItem.length == 2) {
      tableItems[1] = tableItem;
    } else if (tempItem.length == 1) {
      tableItems[2] = tableItem;
    } else {
      tableItems.add(tableItem);
    }
    notifyListeners();
  }

  void cleanTable(int index) {
    debugPrint('Clear index = ${index} and Legnth ${tableItems.length}');

    if (tableItems.length > 3) {
      tableItems.removeAt(index);
    } else {
      tableItems.removeAt(index);
      tableItems.add(TableItem(0, "Waiting Order", "PENDING", []));
    }
    notifyListeners();
  }
}
