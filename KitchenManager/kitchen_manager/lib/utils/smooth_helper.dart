import '../models/table_detail.dart';

class SmoothHelper{
  List<TableDetail> currentTable = [];
  SmoothHelper() {
    currentTable.add(TableDetail(id: 10, tableName: "10", status: "Eating", orders: []));
  }
}