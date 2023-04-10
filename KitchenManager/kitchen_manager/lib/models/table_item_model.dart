import 'package:kitchen_manager/models/cart_item_model.dart';

class TableItem {
  int orderInfoId;
  String? tableName;
  String? status;
  List<CartItem> items;

  TableItem(this.orderInfoId, this.tableName, this.status, this.items);
}


