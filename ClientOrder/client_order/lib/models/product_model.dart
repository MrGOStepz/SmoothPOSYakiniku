import 'food_type_model.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String foodType;
  final int categoryId;
  final int page;
  final int row;
  final int column;
  final int stock;
  final String imagePath;
  final bool isAvailable;

  Product(
      this.id,
      this.name,
      this.price,
      this.foodType,
      this.categoryId,
      this.page,
      this.row,
      this.column,
      this.stock,
      this.imagePath,
      this.isAvailable);
}
