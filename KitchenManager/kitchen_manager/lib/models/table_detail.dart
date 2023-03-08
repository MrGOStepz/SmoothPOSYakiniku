import 'package:kitchen_manager/models/cart_item_model.dart';

import 'order_item_detail.dart';

class TableDetail {
  final int? id;
  final String? tableName;
  final String? status;
  final List<CartItem> items;

  TableDetail(this.id, this.tableName, this.status, this.items);
}

