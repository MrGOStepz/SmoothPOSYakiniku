import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/food_type_model.dart';
import '../models/product_model.dart';

class Products with ChangeNotifier {
  // final List<Product> _items = [
  //   Product(1, "Beef 50g", 50.0, FoodType.main, 1, [], 1, 1, 1, 20, true),
  //   Product(2, "Beef 100g", 50.0, FoodType.main, 1, [], 1, 1, 2, 20, true),
  //   Product(3, "Pork 50g", 50.0, FoodType.main, 1, [], 2, 1, 1, 20, true),
  //   Product(4, "Pork 100g", 50.0, FoodType.main, 1, [], 2, 1, 2, 20, true),
  //   Product(5, "Chicken 50g", 50.0, FoodType.main, 2, [], 1, 1, 1, 20, true),
  //   Product(6, "Chicken 100g", 50.0, FoodType.main, 2, [], 1, 1, 2, 20, true),
  //   Product(7, "Vegetable 50g", 50.0, FoodType.main, 2, [], 1, 2, 1, 20, true),
  //   Product(8, "Vegetable 100g", 50.0, FoodType.main, 2, [], 1, 2, 2, 20, true),
  //   Product(9, "Rice 20g", 50.0, FoodType.main, 2, [], 2, 1, 1, 20, true),
  //   Product(10, "Rice 100g", 50.0, FoodType.main, 2, [], 2, 1, 2, 20, true),
  //   Product(11, "Rice 150g", 50.0, FoodType.main, 2, [], 2, 2, 1, 20, true),
  //   Product(12, "Set Menu Pork", 50.0, FoodType.setMenu, 3, [3, 4, 9, 10, 12],
  //       1, 1, 1, 20, true),
  //   Product(13, "Set Menu Beef", 50.0, FoodType.setMenu, 4, [1, 2, 9, 10, 12],
  //       1, 1, 1, 20, true),
  //   Product(14, "Set Menu Chicken", 50.0, FoodType.setMenu, 3,
  //       [5, 6, 9, 10, 12], 1, 1, 2, 20, true),
  //   Product(15, "Set Menu Premium Beef", 50.0, FoodType.setMenu, 4,
  //       [1, 2, 9, 10, 12], 2, 1, 1, 20, true),
  //   Product(16, "Coke", 50.0, FoodType.beverage, 5, [], 1, 1, 1, 20, true),
  //   Product(17, "Green Tea", 50.0, FoodType.beverage, 6, [], 1, 1, 1, 20, true),
  //   Product(
  //       18, "Ice-cream 1", 50.0, FoodType.dessert, 7, [], 1, 1, 1, 20, true),
  //   Product(
  //       19, "Ice-cream 2", 50.0, FoodType.dessert, 7, [], 1, 1, 2, 20, true),
  // ];
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.http('10.0.2.2:8080', '/api/v1/product/all');
    final response = await http.get(url);
    final List<Product> loadedProduct = [];
    final extractedData = json.decode(response.body) as List<dynamic>;
    if (extractedData == null) {
      return;
    }

    extractedData.forEach((value) {
      loadedProduct.add(
        Product(
            value["id"],
            value["name"],
            value["price"],
            value["foodType"],
            value["categoryInfoId"],
            value["locationPage"],
            value["locationRow"],
            value["locationColumn"],
            value["stock"],
            value["imagePath"],
            value["isAvailable"]),
      );
    });

    _items = loadedProduct.toList();
    debugPrint(_items.toString());
    notifyListeners();
  }

  Future<void> addItem(Product productItem) async {
    items.add(productItem);
    notifyListeners();
  }

  Future<int> deleteItem(int id) async {
    notifyListeners();
    return 1;
  }

  Future<int> updateItem(Product productItem) async {
    notifyListeners();
    return 1;
  }

  List<Product> getProductsByCategory(int categoryId) {
    return _items.where((item) => item.categoryInfoId == categoryId).toList();
  }

  Set<int> getNumberOfPageByCategory(int categoryId) {
    var pageNumber = <int>{};
    List<Product> tempProduct = getProductsByCategory(categoryId);
    tempProduct
        .where((pageProduct) => pageNumber.add(pageProduct.locationPage))
        .toList();
    return pageNumber;
  }

  List<Product> getProductsByCategoryAndPage(int categoryId, int page) {
    return _items
        .where((item) => item.categoryInfoId == categoryId && item.locationPage == page)
        .toList();
  }
}
