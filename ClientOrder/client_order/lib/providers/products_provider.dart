import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_item_model.dart';
import '../models/food_type_model.dart';
import '../models/table_menu_model.dart';

class Products with ChangeNotifier {
  final List<ProductItem> _items = [
    ProductItem(1, "Beef 50g", "", 50.0, FoodType.main, 1, 1, TableMenu(1, 1),[], 1, true, true),
    ProductItem(2, "Beef 100g", "", 50.0, FoodType.main, 1, 1,TableMenu(1, 2), [], 1, true, true),
    ProductItem(3, "Pork 50g", "", 50.0, FoodType.main, 1, 2,TableMenu(1, 1), [], 1, true, true),
    ProductItem(4, "Pork 100g", "", 50.0, FoodType.main, 1, 2,TableMenu(1, 2), [], 1, true, true),
    ProductItem(5, "Chicken 50g", "", 50.0, FoodType.main, 2, 1,TableMenu(1, 1), [], 1, true, true),
    ProductItem(6, "Chicken 100g", "", 50.0, FoodType.main, 2, 1,TableMenu(1, 2), [], 1, true, true),
    ProductItem(7, "Vegetable 50g", "", 50.0, FoodType.main, 2, 1,TableMenu(2, 1), [], 1, true, true),
    ProductItem(8, "Vegetable 100g", "", 50.0, FoodType.main, 2, 1,TableMenu(2, 2), [], 1, true, true),
    ProductItem(9, "Rice 20g", "", 50.0, FoodType.main, 2, 2,TableMenu(1, 1), [], 2, true, true),
    ProductItem(10, "Rice 100g", "", 50.0, FoodType.main, 2, 2,TableMenu(1, 2), [], 1, true, true),
    ProductItem(11, "Rice 150g", "", 50.0, FoodType.main, 2, 2,TableMenu(2, 1), [], 1, true, true),
    ProductItem(12, "Set Menu Pork", "", 50.0, FoodType.setMenu, 3, 1,TableMenu(1, 1), [3,4,9,10,12], 1, true, true),
    ProductItem(13, "Set Menu Beef", "", 50.0, FoodType.setMenu, 4, 1,TableMenu(1, 1), [1,2,9,10,12], 1, true, true),
    ProductItem(14, "Set Menu Chicken", "", 50.0, FoodType.setMenu, 3, 1,TableMenu(1, 2), [5,6,9,10,12], 1, true, true),
    ProductItem(15, "Set Menu Premium Beef", "", 50.0, FoodType.setMenu, 4, 2,TableMenu(1, 1), [1,2,9,10,12], 1, true, true),
    ProductItem(16, "Coke", "", 50.0, FoodType.beverage, 5, 1,TableMenu(1, 1), [], 1, true, true),
    ProductItem(17, "Green Tea", "", 50.0, FoodType.beverage, 6, 1,TableMenu(1, 1), [], 1, true, true),
    ProductItem(18, "Ice-cream 1", "", 50.0, FoodType.dessert, 7, 1,TableMenu(1, 1), [], 1, true, true),
    ProductItem(19, "Ice-cream 2", "", 50.0, FoodType.dessert, 7, 1,TableMenu(1, 2), [], 1, true, true),
  ];

  List<ProductItem> get items {
    return [..._items];
  }

  ProductItem findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    try {
      notifyListeners();
    }catch (error) {
      //TODO Do something for error
    }
  }

  Future<void> addItem(ProductItem productItem) async {
    items.add(productItem);
    notifyListeners();
  }

  Future<int> deleteItem(int id) async {
    notifyListeners();
    return 1;
  }

  Future<int> updateItem(ProductItem productItem) async {
    notifyListeners();
    return 1;
  }
}
