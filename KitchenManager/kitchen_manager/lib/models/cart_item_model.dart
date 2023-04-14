class CartItem {
  int? productId;
  String? name;
  String? description;
  int? quantity;
  double? price;
  String? comment;

  CartItem(
    this.productId,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.comment,
  );

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['comment'] = comment;
    return data;
  }
}
