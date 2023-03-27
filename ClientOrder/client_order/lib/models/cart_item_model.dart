import 'product_model.dart';

// class CartItem {
//   int? id = 0;
//   String? title = "";
//   String? description = "";
//   int? quantity = 0;
//   double? price = 0.0;
//
//   CartItem({
//     this.id,
//     this.title,
//     this.description,
//     this.price,
//     this.quantity,
//   });
//
//   CartItem.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['name'];
//     description = json['address'];
//     quantity = json['quantity'];
//     price = json['price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     return data;
//   }
// }
class CartItem {
  late final int productId;
  late final String name;
  late final String description;
  late final int quantity;
  late final double price;
  late final String comment;

  CartItem({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.comment,
  });

  CartItem.fromJson(Map<String, dynamic> json, this.productId, this.name,
      this.description, this.quantity, this.price, this.comment) {
    productId = json['productId'];
    name = json['name'];
    description = json['address'];
    quantity = json['quantity'];
    price = json['price'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['comment'] = this.comment;
    return data;
  }
}
