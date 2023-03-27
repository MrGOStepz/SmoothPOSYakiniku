import '../cart_item_model.dart';

class CartRequest {
  int? tableId;
  List<CartItem>? cartItems;

  CartRequest(this.tableId, this.cartItems);

  CartRequest.fromJson(Map<String, dynamic> json) {
    tableId = json['tableId'];
    cartItems = json['cartItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tableId'] = tableId;
    data['cartItems'] = cartItems;
    return data;
  }
}