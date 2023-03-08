import 'cart_item_model.dart';

class Order {
  String? tableName;
  List<CartItem>? cartItems;

  Order({this.tableName, this.cartItems});
}