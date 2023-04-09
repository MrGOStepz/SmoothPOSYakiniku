import 'package:kitchen_manager/models/cart_item_model.dart';

import 'table_info_model.dart';

class TableItem {
  final int? orderInfoId;
  final TableInfo tableInfo;
  final String? status;
  final List<CartItem> items;

  TableItem(this.orderInfoId, this.tableInfo, this.status, this.items);
}

