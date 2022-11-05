import 'package:flutter/cupertino.dart';

import '../../models/product_model.dart';
import 'main_menu_item.dart';

class MainMenu extends StatelessWidget {
  final List<ProductItem> lstMenu;
  final int currentPage;
  final Function(int, int) currentCategoryAndPage;

  const MainMenu(
      {Key? key,
      required this.lstMenu,
      required this.currentCategoryAndPage,
      required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductItem> productItem =
        lstMenu.where((item) => item.page == currentPage).toList();

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
