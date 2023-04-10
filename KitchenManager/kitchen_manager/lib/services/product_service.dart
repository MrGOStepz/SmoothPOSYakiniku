import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_item_model.dart';

import '../models/table_info_model.dart';

class ProductService {
  Queue<TableItem> tableQueue = Queue<TableItem>();

  ProductService() {
    //TODO Initial Table Detail
  }

  TableItem getNextTable() {
    if (tableQueue.isNotEmpty) {
      TableItem popTableDetail = tableQueue.removeFirst();
      return popTableDetail;
    } else {
      return TableItem(0, 'Waiting For Order', "FREE", []);
    }
  }

  void addNextTable() {
    //TODO Get next Table from Server
  }
}

void main() {
  // ProductService productService = ProductService();
  // print(productService.getNextTable().tableName);
  // print(productService.getNextTable().tableName);
}
