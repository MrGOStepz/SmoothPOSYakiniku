import 'product_model.dart';

class CartItem {
  final int id;
  final List<Product> products;
  final int quality;
  final double price;

  CartItem(this.id, this.products, this.quality, this.price);
}


