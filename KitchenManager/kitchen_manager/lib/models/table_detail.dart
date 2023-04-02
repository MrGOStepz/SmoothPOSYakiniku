import 'package:kitchen_manager/models/cart_item_model.dart';

class TableItem {
  final int? orderInfoId;
  final String? tableName;
  final String? status;
  final List<CartItem> items;

  TableItem(this.orderInfoId, this.tableName, this.status, this.items);
}

