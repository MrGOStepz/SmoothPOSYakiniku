import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/order_item_detail.dart';
import '../models/table_detail.dart';

class TableProvider with ChangeNotifier {
  final Queue<TableDetail> queueTable = Queue();

  List<TableDetail> tableDetail = [
    TableDetail(1, "1", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ])
  ];

  void initMock() {
    queueTable.add(TableDetail(1, "1", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ]));

    queueTable.add(TableDetail(2, "2", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ]));

    queueTable.add(TableDetail(3, "3", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ]));

    queueTable.add(TableDetail(4, "4", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ]));

    queueTable.add(TableDetail(5, "5", "Order", [
      OrderItemDetail(1, "Beef 50"),
      OrderItemDetail(2, "Rice 20"),
      OrderItemDetail(3, "Water 20")
    ]));

    debugPrint('Queue Total = ${queueTable.length.toString()}');
  }

  Queue<TableDetail> get items {
    return queueTable;
  }

  Future<void> fetchAndSetTableDetail() async {
    try {
      notifyListeners();
    } catch (error) {
      //TODO Something
    }
  }

  TableDetail popTableDetail() {
    if(queueTable.isEmpty) {
      return TableDetail(0, "EMPTY", 'FREE', []);
    } else {
      return queueTable.removeFirst();
    }
  }
}
