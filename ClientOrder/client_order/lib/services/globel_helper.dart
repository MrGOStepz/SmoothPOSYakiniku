import 'package:client_order/models/globle_model.dart';

import '../models/cart_list.dart';

class HelperService {
  late GlobalMenu globalMenu;
  List<Product> getAllProduct() {
    return globalMenu.products;
  }
}