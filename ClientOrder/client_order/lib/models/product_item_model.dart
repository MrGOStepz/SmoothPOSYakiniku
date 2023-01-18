import 'food_type_model.dart';
import 'table_menu_model.dart';

class ProductItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final FoodType foodType;
  final int category;
  final int page;
  final TableMenu tableMenu;
  final List<int> listProduct;
  final int order;
  final bool isAvailable;
  final bool isActive;

  ProductItem(
      this.id,
      this.name,
      this.description,
      this.price,
      this.foodType,
      this.category,
      this.page,
      this.tableMenu,
      this.listProduct,
      this.order,
      this.isAvailable,
      this.isActive);
}
