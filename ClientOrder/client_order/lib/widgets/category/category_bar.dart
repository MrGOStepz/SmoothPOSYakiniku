import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_item_model.dart';
import '../../providers/products_provider.dart';
import 'category_bar_item.dart';

class CategoryMenuBar extends StatelessWidget {
  final int currentCategory;
  final Function(int) selectMenubar;

  const CategoryMenuBar(
      {Key? key, required this.selectMenubar, required this.currentCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    List<ProductItem> lstProductItem = product.items
        .where((item) => item.category == currentCategory)
        .toList();

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
                tapMenubar: selectMenubar,
              ))
          .toList(),
    );
  }
}
