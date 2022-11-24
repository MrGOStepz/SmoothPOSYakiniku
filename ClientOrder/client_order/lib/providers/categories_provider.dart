import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class Categories with ChangeNotifier {
  final List<Category> _items = [
    Category(1, "MAIN 1"),
    Category(2, "MAIN 2"),
    Category(3, "SET MENU 1"),
    Category(4, "SET MENU 2"),
    Category(5, "BEVERAGE 1"),
    Category(6, "BEVERAGE 2"),
    Category(7, "DESSERT 1"),
  ];

  List<Category> get items {
    return [..._items];
  }

  Category findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> addItem(Category productItem) async {
    items.add(productItem);
    notifyListeners();
  }

  Future<int> deleteItem(int id) async {
    notifyListeners();
    return 1;
  }

  Future<int> updateItem(Category productItem)  async {
    notifyListeners();
    return 1;
  }
}