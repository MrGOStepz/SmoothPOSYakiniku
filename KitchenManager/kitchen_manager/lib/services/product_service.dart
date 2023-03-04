import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';

class ProductService {
  Queue<TableDetail> tableQueue = Queue<TableDetail>();

  ProductService() {
    //TODO Initial Table Detail
  }

  TableDetail getNextTable() {
    if (tableQueue.isNotEmpty) {
      TableDetail popTableDetail = tableQueue.removeFirst();
      return popTableDetail;
    } else {
      return TableDetail(0, "", "FREE", []);
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
