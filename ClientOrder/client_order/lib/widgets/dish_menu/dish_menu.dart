import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_item_model.dart';
import '../../providers/products_provider.dart';
import 'dish_menu_item.dart';

class DishMenu extends StatelessWidget {
  final int currentCategory;
  final int currentPage;

  DishMenu({Key? key, required this.currentCategory, required this.currentPage})
      : super(key: key);

  Widget generateExpanded(List<ProductItem> productItems, int row, int column) {
    try {
      ProductItem productItem = productItems
          .where((value) =>
              value.tableMenu.row == row && value.tableMenu.column == column)
          .first;
      return ProductMenuItem(
          id: productItem.id, price: productItem.price, name: productItem.name);
    } catch (e) {
      return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    var sizeScreen = MediaQuery.of(context).size;
    var itemHeight = sizeScreen.height;
    var itemWidth = sizeScreen.width / 2;
    List<ProductItem> productItem = product.items
        .where((item) =>
            item.category == currentCategory && item.page == currentPage)
        .toList();

    return Container(
        width: double.infinity,
        height: itemHeight,
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 1, child: generateExpanded(productItem, 1, 1)),
                Expanded(flex: 1, child: generateExpanded(productItem, 1, 2))
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: generateExpanded(productItem, 2, 1)),
                  Expanded(
                    flex: 1,
                    child: generateExpanded(productItem, 2, 2),
                  )
                ],
              )),
        ]));
  }
}
