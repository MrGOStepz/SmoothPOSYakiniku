import 'package:client_order/models/product_model.dart';
import 'package:client_order/widgets/menu_page/menu_bar_item.dart';
import 'package:flutter/material.dart';

class CategoryMenuBar extends StatelessWidget {
  final int currentCategory;
  final List<ProductItem> productItem;
  final Function(int) tapMenubar;

  const CategoryMenuBar(
      {Key? key,
      required this.tapMenubar,
      required this.currentCategory,
      required this.productItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductItem> lstProductItem =
        productItem.where((item) => item.category == currentCategory).toList();

    var pageNumber = <int>{};
    lstProductItem
        .where((pageProduct) => pageNumber.add(pageProduct.page))
        .toList();

    return ListView(
      scrollDirection: Axis.horizontal,
      children: pageNumber
          .map((e) => MenuBarPage(
                key: ValueKey(e),
                page: e,
                tapMenubar: tapMenubar,
              ))
          .toList(),
    );
  }
}
