import 'order_item_detail.dart';

class TableDetail {
  final int id;
  final String tableName;
  final String status;
  final List<OrderItemDetail> items;

  TableDetail({required this.id,required this.tableName, required this.status, required this.items});
}

