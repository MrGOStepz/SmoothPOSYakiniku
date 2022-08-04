class TableDetail {
  final int id;
  final String tableName;
  final String status;
  final List<ItemDetail> items;

  TableDetail({required this.id,required this.tableName, required this.status, required this.items});
}

class ItemDetail {
  final int id;
  final String name;

  ItemDetail({required this.id, required this.name});
}