import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kitchen_manager/mock_input.dart';
import 'package:kitchen_manager/models/table_detail.dart';

class ProductService {
  MockInput mockInput = MockInput();
  Queue<TableDetail> tableQueue = Queue<TableDetail>();

  ProductService() {
    //TODO Initial Table Detail
    tableQueue.addAll(mockInput.listTable);
  }

  TableDetail getNextTable() {
    if (tableQueue.isNotEmpty) {
      TableDetail popTableDetail = tableQueue.removeFirst();
      return popTableDetail;
    } else {
      return TableDetail(id: 0, tableName: "", status: "FREE", items: []);
    }
  }

  void addNextTable() {
    //TODO Get next Table from Server
  }
}

void main() {
  ProductService productService = ProductService();
  print(productService.getNextTable().tableName);
  print(productService.getNextTable().tableName);
}
