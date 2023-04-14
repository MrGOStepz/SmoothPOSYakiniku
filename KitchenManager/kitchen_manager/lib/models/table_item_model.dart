import 'package:kitchen_manager/models/cart_item_model.dart';

class TableItem {
  int orderInfoId = 0;
  String? tableName;
  String? status;
  List<CartItem> items = [];

  TableItem(this.orderInfoId, this.tableName, this.status, this.items);

  TableItem.fromJson(Map<String, dynamic> json) {
    List<CartItem> cartItemList = [];
    orderInfoId = json['orderInfoId'];
    tableName = json['name'];
    status = json['status'];
    for (var item in json['items']) {
      cartItemList.add(CartItem.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderInfoId'] = orderInfoId;
    data['name'] = tableName;
    data['status'] = status;
    data['items'] = items;
    return data;
  }
}
