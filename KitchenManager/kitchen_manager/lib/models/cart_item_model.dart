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
}
