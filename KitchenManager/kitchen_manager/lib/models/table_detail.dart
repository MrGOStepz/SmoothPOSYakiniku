class TableDetail {
  final int id;
  final String tableName;
  final String status;
  final List<OrderItemDetail> items;

  TableDetail({required this.id,required this.tableName, required this.status, required this.items});
}

class OrderItemDetail {
  final int id;
  final String name;

  OrderItemDetail({required this.id, required this.name});
}