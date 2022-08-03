import 'package:kitchen_manager/models/table_detail.dart';

class MockInput {
  List<TableDetail> listTable = [];

  MockInput() {
    listTable.add(TableDetail(id: 1, tableName: "1", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
    listTable.add(TableDetail(id: 2, tableName: "2", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
    listTable.add(TableDetail(id: 3, tableName: "3", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
    listTable.add(TableDetail(id: 4, tableName: "4", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
    listTable.add(TableDetail(id: 5, tableName: "5", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
    listTable.add(TableDetail(id: 6, tableName: "6", status: "Order", orders: ["Beef 50", "Rice 20", "Water 10"]));
  }

  List<TableDetail> getListTable(){
    return listTable;
  }
}