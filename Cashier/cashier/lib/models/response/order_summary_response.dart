import '../order_detail_modal.dart';
import '../order_info_modal.dart';

class OrderSummaryResponse {
  late List<OrderDetail> orderDetailList;

  OrderSummaryResponse({required this.orderDetailList});
}
