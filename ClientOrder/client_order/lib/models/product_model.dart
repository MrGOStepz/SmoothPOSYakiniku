import 'food_type_model.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final FoodType foodType;
  final int categoryId;
  final List<int> subProductId;
  final int page;
  final int row;
  final int column;
  final int stock;
  final bool isAvailable;

  Product(
      this.id,
      this.name,
      this.price,
      this.foodType,
      this.categoryId,
      this.subProductId,
      this.page,
      this.row,
      this.column,
      this.stock,
      this.isAvailable);
}
