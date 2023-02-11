import 'food_type_model.dart';
import 'table_menu_model.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final FoodType foodType;
  final int categoryId;
  final int page;
  final TableMenu tableMenu;
  final List<int> listProduct;
  final int order;
  final bool isAvailable;

  Product(
      this.id,
      this.name,
      this.price,
      this.foodType,
      this.categoryId,
      this.page,
      this.tableMenu,
      this.listProduct,
      this.order,
      this.isAvailable);
}
