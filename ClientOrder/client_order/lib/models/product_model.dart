import 'category_model.dart';
import 'food_type_model.dart';
import 'product_item_model.dart';
import 'table_menu_model.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String foodType;
  final int stock;
  final int isAvailable;
  final int isActive;

  Product(this.id, this.name, this.description, this.price, this.foodType,
      this.stock, this.isAvailable, this.isActive);
}

List<Category> DUMMY_CATEGORY = [
  Category(1, "MAIN 1"),
  Category(2, "MAIN 2"),
  Category(3, "SET MENU 1"),
  Category(4, "SET MENU 2"),
  Category(5, "BEVERAGE 1"),
  Category(6, "BEVERAGE 2"),
  Category(7, "DESSERT 1"),
];

List<ProductItem> DUMMY_PRODUCT = [
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