import 'package:client_order/models/product_model.dart';
import 'package:flutter/material.dart';

import 'product_menu_item.dart';

class CategoryMenuList extends StatelessWidget {
  final int currentCategory;
  final Function(int) menuItemTap;

  const CategoryMenuList(
      {Key? key, required this.menuItemTap, required this.currentCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductItem> lstProductItem = DUMMY_PRODUCT
        .where((item) => item.category == currentCategory)
        .toList();

    for (var element in lstProductItem) {
      debugPrint(element.name);
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: lstProductItem
          .map((item) => ProductMenuItem(
                key: ValueKey(item.id),
                productItem: item,
              ))
          .toList(),
    );
  }
}
