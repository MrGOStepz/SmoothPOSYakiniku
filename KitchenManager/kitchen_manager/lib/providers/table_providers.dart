import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/table_info_model.dart';
import '../models/table_item_model.dart';

class TableProvider with ChangeNotifier {
  List<TableItem> _tableItems = [
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", []),
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", []),
    TableItem(0, TableInfo(0, "Waiting Order"), "PENDING", [])
  ];
  TableItem vacantTable =
      TableItem(0, TableInfo(0, 'Waiter Table'), "PENDING", []);

  // Future<List<TableItem>> initMock() async {
  //   List<TableItem> tempTable = [];
  //   tempTable.add(TableItem(1, TableInfo(1, '1'), "Cook", [
  //     CartItem(1, "Beef 50", "", 50.0, 1, ""),
  //     CartItem(2, "Beef 100", "", 50.0, 1, "")
  //   ]));
  //   tempTable.add(TableItem(2, TableInfo(2,'2'), "Cook", [
  //     CartItem(1, "Beef 60", "", 50.0, 1, ""),
  //     CartItem(2, "Beef 100", "", 50.0, 1, "")
  //   ]));
  //   tempTable.add(TableItem(3, "3", "Cook", [
  //     CartItem(1, "Beef 70", "", 50.0, 1, ""),
  //     CartItem(2, "Beef 100", "", 50.0, 1, "")
  //   ]));
  //   tempTable.add(TableItem(4, "4", "Cook", [
  //     CartItem(1, "Beef 70", "", 50.0, 1, ""),
  //     CartItem(2, "Beef 100", "", 50.0, 1, "")
  //   ]));
  //   tempTable.add(TableItem(5, "5", "Cook", [
  //     CartItem(1, "Beef 80", "", 50.0, 1, ""),
  //     CartItem(2, "Beef 100", "", 50.0, 1, "")
  //   ]));
  //   return tempTable;
  // }

  List<TableItem> get items {
    return _tableItems;
  }

  // String tempTableName = '1';

  // void addTempItem() {
  //   tempTableName += tempTableName;
  //   addItem(TableItem(
  //       1, tempTableName, 'Cook', [CartItem(2, "Beef 100", "", 50.0, 1, "")]));
  // }

  Future<void> fetchAndSetTableDetail() async {
    final url = Uri.http('10.0.2.2:8080', '/api/v1/order/cook');
    final response = await http.get(url);
    final List<TableItem>  loadItems = [];
    final extractedData = json.decode(response.body) as List<dynamic>;

    for (var value in extractedData) {
      loadItems.add(
        TableItem(value['orderInfoId'],
        value['TableInfo'],
        value['status'],
        value['items'])
      );
    }
    await initTableItem(loadItems);
    notifyListeners();
  }

  Future<void> initTableItem(List<TableItem> listTableItem) async {
    if (listTableItem.length > 3) {
      for (int i = 0; i < listTableItem.length; i++) {
        if (i < 3) {
          _tableItems[i] = listTableItem[i];
        } else {
          _tableItems.add(listTableItem[i]);
        }
      }
    } else {
      for (int i = listTableItem.length - 1; i >= 0; i--) {
        _tableItems[i] = listTableItem[i];
      }
    }
  }

  void addItem(TableItem tableItem) {
    List<TableItem> tempItem =
        _tableItems.where((value) => value.orderInfoId == 0).toList();

    debugPrint('Current Length: ${tempItem.length}');
    if (tempItem.length == 3) {
      _tableItems[0] = tableItem;
    } else if (tempItem.length == 2) {
      _tableItems[1] = tableItem;
    } else if (tempItem.length == 1) {
      _tableItems[2] = tableItem;
    } else {
      _tableItems.add(tableItem);
    }
    notifyListeners();
  }

  void cleanTable(int index) {
    debugPrint('Clear index = ${index} and Legnth ${_tableItems.length}');

    if (_tableItems.length > 3) {
      _tableItems.removeAt(index);
    } else {
      _tableItems.removeAt(index);
      _tableItems.add(vacantTable);
    }
    notifyListeners();
  }
}
