import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/cart_item_model.dart';
import '../models/request/order_status_request.dart';
import '../models/table_item_model.dart';

class TableProvider with ChangeNotifier {
  List<TableItem> tableItems = [
    TableItem(0, "Waiting Order", "PENDING", []),
    TableItem(0, "Waiting Order", "PENDING", []),
    TableItem(0, "Waiting Order", "PENDING", [])
  ];
  TableItem vacantTable = TableItem(0, 'Waiter Table', "PENDING", []);

  List<TableItem> get items {
    return tableItems;
  }

  Future<void> fetchAndSetTableDetail() async {
    final url = Uri.http(
        GlobalConfiguration().get("server_endpoint"), '/api/v1/order/cook');
    final response = await http.get(url);
    final List<TableItem> loadItems = [];
    final extractedData = json.decode(response.body) as List<dynamic>;
    for (var value in extractedData) {
      print(value.toString());
      List<CartItem> tempCartItemList = [];
      for (var cart in value['items']) {
        CartItem cartItem = CartItem.fromJson(cart);
        tempCartItemList.add(cartItem);
      }
      loadItems.add(TableItem(
          value['orderInfoId'], value['tableName'], 'Cook', tempCartItemList));
    }
    await initTableItem(loadItems);

    notifyListeners();
  }

  Future<void> getOrderClient() async {}

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

  void cleanTable(int index) async {
    print(tableItems);
    print(index);

    if (tableItems[index].orderInfoId != 0) {
      await updateStatus(tableItems[index].orderInfoId);
    }

    if (tableItems.length > 3) {
      tableItems.removeAt(index);
    } else {
      tableItems.removeAt(index);
      tableItems.add(vacantTable);
    }
    notifyListeners();
  }

  Future<void> updateStatus(int orderInfoId) async {
    final url = Uri.http(GlobalConfiguration().get('server_endpoint'), '/api/v1/order/update/status');
    OrderStatusRequest orderStatusReq = OrderStatusRequest(orderInfoId, 'DONE');
    await http.put(
      url,
      body: json.encode(orderStatusReq.toJson()),
    );
  }
}
