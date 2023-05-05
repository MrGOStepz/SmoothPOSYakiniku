import 'dart:convert';

import 'package:client_order/models/order_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/order_detail_modal.dart';
import '../models/order_info_modal.dart';
import '../models/product_model.dart';
import '../models/request/order_status_request.dart';
import '../models/table_info_model.dart';
import '../services/web_socket.dart';

class OrderProvider with ChangeNotifier {
  late List<OrderDetail> _orderDetailItems = [];
  late List<OrderInfo> _orderInfoItems = [];
  late List<Product> _productItems = [];
  late String _tableName;

  late String summaryText = '';

  get orderInfoItems {
    return _orderInfoItems;
  }

  get orderDetailItems {
    return _orderDetailItems;
  }

  get orderDetailItemLength {
    return _orderDetailItems.length;
  }

  get orderInfoItemLength {
    return _orderInfoItems.length;
  }

  get getSummaryText {
    return summaryText;
  }

  String getOrderDetailText(List<Product> productList) {
    _productItems = productList;
    var buffer = StringBuffer();
    double total = 0.0;
    for (var orderDetail in _orderDetailItems) {
      String productName = productList
          .firstWhere((element) => element.id == orderDetail.productId)
          .name;
      if (orderDetail.popupDetailId == 1) {
        double price = orderDetail.price * orderDetail.quantity;
        buffer.write(
            '$productName อุด้ง x ${orderDetail.quantity} = $price\n');
        total += price;
      } else if (orderDetail.popupDetailId == 2) {
        double price = (orderDetail.price + 20) * orderDetail.quantity;
        buffer.write(
            '$productName อุด้งเส้นแบน x ${orderDetail.quantity} = $price\n');
        total += price;
      }else if (orderDetail.popupDetailId == 3) {
        double price = orderDetail.price * orderDetail.quantity;
        buffer.write(
            '$productName ราเมง x ${orderDetail.quantity} = $price\n');
        total += price;
      } else {
        double price = orderDetail.price * orderDetail.quantity;
        buffer.write(
            '$productName x ${orderDetail.quantity} = $price\n');
        total += price;
      }
    }
    buffer.write('ราคารวม $total');
    return buffer.toString();
  }

  Future<void> updateStatus() async {
    final url = Uri.http(GlobalConfiguration().get('server_endpoint'),
        '/api/v1/order/update/status');
    OrderStatusRequest orderStatusReq;
    for (var item in _orderInfoItems) {
      orderStatusReq = OrderStatusRequest(item.id, 'PAID');
      await http.put(
        url,
        body: json.encode(orderStatusReq.toJson()),
      );
    }
    _orderInfoItems.clear();
    _orderDetailItems.clear();
    notifyListeners();
  }

  Future<void> getSummaryToday() async {
    final url = Uri.http(
        GlobalConfiguration().get("server_endpoint"), '/api/v1/order/summary');
    try {
      final response = await http.get(
        url,
      );

      final extractedData = jsonDecode(utf8.decode(response.bodyBytes));

      List<OrderSummary> orderSummaryList = [];
      for (var value in extractedData['orderSummaries']) {
        OrderSummary orderSummary = OrderSummary(
            productId: value['productId'],
            popupDetailId: value['popupDetailId'],
            quantity: value['quantity'],
            amount: value['amount']);
        orderSummaryList.add(orderSummary);
      }

      var buffer = StringBuffer();
      double totalToday = 0;
      for (var orderDetail in orderSummaryList) {
        String productName = _productItems
            .firstWhere((element) => element.id == orderDetail.productId)
            .name;
        if (orderDetail.popupDetailId == 1) {
          buffer.write(
              '${productName} อุด้ง x ${orderDetail.quantity} = ${orderDetail.amount} \n');
        } else if (orderDetail.popupDetailId == 2) {
          totalToday += 20;
          buffer.write(
              '${productName} อุด้งแบน x ${orderDetail.quantity} = ${orderDetail.amount} \n');
        } else if (orderDetail.popupDetailId == 3) {
          buffer.write(
              '${productName} ราแมง x ${orderDetail.quantity} = ${orderDetail.amount} \n');
        } else {
          buffer.write(
              '${productName} x ${orderDetail.quantity} = ${orderDetail.amount} \n');
        }
        totalToday += orderDetail.amount;
      }
      buffer.write('ราคารวมวันนี้ = ${totalToday}');
      summaryText = buffer.toString();
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> sendOrderToBackEnd(String tableName) async {
    _tableName = tableName;
    final url = Uri.http(GlobalConfiguration().get("server_endpoint"),
        '/api/v1/order/table/$tableName');
    try {
      final response = await http.get(
        url,
      );

      final extractedData = jsonDecode(utf8.decode(response.bodyBytes));

      List<OrderInfo> orderInfoList = [];
      for (var value in extractedData['orderInfoList']) {
        OrderInfo orderInfo = OrderInfo(
            id: value['id'],
            tableName: value['tableName'],
            receiptJson: value['receiptJson'],
            status: value['status'],
            orderType: value['orderType'],
            amount: value['amount'],
            startedTime: value['startedTime'],
            lastUpdatedTime: value['lastUpdatedTime']);
        orderInfoList.add(orderInfo);
      }

      List<OrderDetail> orderDetailList = [];
      for (var value in extractedData['orderDetailList']) {
        OrderDetail orderDetail = OrderDetail(
            orderDetailId: value['orderDetailId'],
            productId: value['productId'],
            orderIntoId: value['orderInfoId'],
            popupDetailId: value['popupDetailId'],
            status: value['status'],
            quantity: value['quantity'],
            price: value['price'],
            comment: value['comment'],
            startedTime: value['startedTime'],
            lastUpdatedTime: value['lastUpdatedTime']);
        orderDetailList.add(orderDetail);
      }

      _orderInfoItems = orderInfoList;
      _orderDetailItems = orderDetailList;

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void sendTableStatus() {
    TableInfo tableInfo = TableInfo(name: _tableName, status: 'Free');

    var request = jsonEncode(tableInfo.toJson());
    stompClient.send(
      destination: '/app/table/update',
      body: request,
    );
  }
}
