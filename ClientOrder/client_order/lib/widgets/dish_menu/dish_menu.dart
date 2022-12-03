import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/products_provider.dart';
import 'dish_menu_item.dart';

class DishMenu extends StatelessWidget {
  final int currentCategory;
  final int currentPage;

  const DishMenu(
      {Key? key, required this.currentCategory, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    List<ProductItem> productItem = product.items
        .where((item) =>
            item.category == currentCategory && item.page == currentPage)
        .toList();

    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: productItem
          .map(
            (menu) => ProductMenuItem(
              id: menu.id,
              name: menu.name,
            ),
          )
          .toList(),
    );
  }
}
