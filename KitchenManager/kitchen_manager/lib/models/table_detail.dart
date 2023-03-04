import 'order_item_detail.dart';

class TableDetail {
  final int id;
  final String tableName;
  final String status;
  final List<OrderItemDetail> items;

  TableDetail(this.id, this.tableName, this.status, this.items);
}

