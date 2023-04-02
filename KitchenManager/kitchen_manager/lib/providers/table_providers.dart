import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/cart_item_model.dart';

import '../models/table_detail.dart';

class TableProvider with ChangeNotifier {
  final Queue<TableItem> queueTable = Queue();

  List<TableItem> tableItems = [
    // TableDetail(1, "1", "Order", [
    //   OrderItemDetail(1, "Beef 50"),
    //   OrderItemDetail(2, "Rice 20"),
    //   OrderItemDetail(3, "Water 20")
    // ])
  ];

  void initMock() {
    queueTable.add(
        TableItem(1, "2", "Cook", [
          CartItem(1, "Beef 50", "", 50.0, 1, ""),
          CartItem(2, "Beef 100", "", 50.0, 1, "")
        ]));
    queueTable.add(
        TableItem(2, "3", "Cook", [
          CartItem(1, "Beef 60", "", 50.0, 1, ""),
          CartItem(2, "Beef 100", "", 50.0, 1, "")
        ]));
    queueTable.add(
        TableItem(3, "4", "Cook", [
          CartItem(1, "Beef 70", "", 50.0, 1, ""),
          CartItem(2, "Beef 100", "", 50.0, 1, "")
        ]));
    queueTable.add(
        TableItem(4, "5", "Cook", [
          CartItem(1, "Beef 70", "", 50.0, 1, ""),
          CartItem(2, "Beef 100", "", 50.0, 1, "")
        ]));
    queueTable.add(
        TableItem(5, "6", "Cook", [
          CartItem(1, "Beef 80", "", 50.0, 1, ""),
          CartItem(2, "Beef 100", "", 50.0, 1, "")
        ]));
    //
    // debugPrint('Queue Total = ${queueTable.length.toString()}');
  }

  Queue<TableItem> get items {
    return queueTable;
  }

  Future<void> fetchAndSetTableDetail() async {
    try {
      //TODO Subscribe to service.
      // queueTable.add(tableItem);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  TableItem popTableDetail() {
    if (queueTable.isEmpty) {
      return TableItem(0, "EMPTY", 'FREE', []);
    } else {
      return queueTable.removeFirst();
    }
  }
}
