import 'product_model.dart';

class CartItem {
  final int id;
  final Product product;
  final List<Product> popups;
  final int quality;

  CartItem(this.id, this.product, this.popups, this.quality);
}


