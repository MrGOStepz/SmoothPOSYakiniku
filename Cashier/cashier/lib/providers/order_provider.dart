import 'dart:convert';
import 'package:client_order/providers/product_provider.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import '../models/order_detail_modal.dart';
import '../models/order_info_modal.dart';
import '../models/product_model.dart';
import '../models/request/order_status_request.dart';
import '../models/response/order_detail_response.dart';

class OrderProvider with ChangeNotifier {
  late List<OrderDetail> _orderDetailItems = [];
  late List<OrderInfo> _orderInfoItems = [];

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

  String getOrderDetailText(List<Product> productList) {
    var buffer = StringBuffer();
    double total = 0.0;
    for(var orderDetail in _orderDetailItems) {
      String productName = productList.firstWhere((element) => element.id == orderDetail.productId).name;
      buffer.write('$productName x ${orderDetail.quantity} = ${orderDetail.price * orderDetail.quantity} \n');
      total += orderDetail.price;
    }
    buffer.write('ราคารวม $total');
    return buffer.toString();

  }

  Future<void> updateStatus() async {
    final url = Uri.http(GlobalConfiguration().get('server_endpoint'), '/api/v1/order/update/status');
    OrderStatusRequest orderStatusReq;
    for(var item in _orderInfoItems) {
      orderStatusReq = OrderStatusRequest(
          item.id, 'PAID');
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
        GlobalConfiguration().get("server_endpoint"),
        '/api/v1/order/summary');
    try {
      final response = await http.get(
        url,
      );

      final extractedData = jsonDecode(utf8.decode(response.bodyBytes));

      List<OrderInfo> orderInfoList = [];
      for (var value in extractedData['orderInfoList']) {
        OrderInfo orderInfo = OrderInfo(id: value['id'],
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

      debugPrint(_orderDetailItems.toString());
      debugPrint(_orderInfoItems.toString());

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> sendOrderToBackEnd(String tableName) async {
    final url = Uri.http(
        GlobalConfiguration().get("server_endpoint"),
        '/api/v1/order/table/$tableName');
    try {
      final response = await http.get(
        url,
      );

      final extractedData = jsonDecode(utf8.decode(response.bodyBytes));

      List<OrderInfo> orderInfoList = [];
      for (var value in extractedData['orderInfoList']) {
        OrderInfo orderInfo = OrderInfo(id: value['id'],
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

      debugPrint(_orderDetailItems.toString());
      debugPrint(_orderInfoItems.toString());

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}