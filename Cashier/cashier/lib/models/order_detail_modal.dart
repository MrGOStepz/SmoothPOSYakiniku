class OrderDetail {
  late final int orderDetailId;
  late final int productId;
  late final int orderIntoId;
  late final String status;
  late final int quantity;
  late final double price;
  late final String comment;
  late final String startedTime;
  late final String lastUpdatedTime;
  late String productName;

  OrderDetail({
    required this.orderDetailId,
    required this.productId,
    required this.orderIntoId,
    required this.status,
    required this.quantity,
    required this.price,
    required this.comment,
    required this.startedTime,
    required this.lastUpdatedTime
  });

  OrderDetail.fromJson(Map<String, dynamic> json, this.orderDetailId,
      this.productId, this.orderIntoId, this.status, this.quantity, this.price,
      this.comment, this.startedTime, this.lastUpdatedTime) {
    orderDetailId = json['orderDetailId'];
    productId = json['productId'];
    orderIntoId = json['orderInfoId'];
    status = json['status'];
    quantity = json['quantity'];
    price = json['price'];
    comment = json['comment'];
    startedTime = json['startedTime'];
    lastUpdatedTime = json['lastUpdatedTime'];
  }

}