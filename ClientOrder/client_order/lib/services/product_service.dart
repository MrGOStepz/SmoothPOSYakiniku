import '../models/cart_list.dart';

class ProductService {
  List<Product> products = [];

  void initialProductService() {
    // Call API to get all Product
    // products =
  }

  List<Product> getAllProduct() {
    return products;
  }

  List<Product> getPopupProduct(int productId) {
    //TODO get popupProduct from ProductiD
    List<Product> popupProduct = [];
    return popupProduct;
  }
}
