import 'package:kitchen_manager/models/table_detail.dart';

class MockInput {
  List<TableDetail> listTable = [];

  MockInput() {
    listTable.add(TableDetail(id: 1, tableName: "1", status: "Order", items: [ItemDetail(id: 1, name: "Beef 50"),
      ItemDetail(id: 2, name: "Rice 20"), ItemDetail(id: 3, name: "Water 20")]));
    listTable.add(TableDetail(id: 2, tableName: "2", status: "Order", items: [ItemDetail(id: 1, name: "Beef 60"),
      ItemDetail(id: 2, name: "Rice 30"), ItemDetail(id: 3, name: "Water 30")]));
    listTable.add(TableDetail(id: 3, tableName: "3", status: "Order", items: [ItemDetail(id: 1, name: "Beef 70"),
      ItemDetail(id: 2, name: "Rice 40"), ItemDetail(id: 3, name: "Water 40")]));
    listTable.add(TableDetail(id: 4, tableName: "4", status: "Order", items: [ItemDetail(id: 1, name: "Beef 80"),
      ItemDetail(id: 2, name: "Rice 50"), ItemDetail(id: 3, name: "Water 50")]));
  }

  List<TableDetail> getListTable(){
    return listTable;
  }
}