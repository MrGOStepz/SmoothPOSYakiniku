import 'package:client_order/models/product_model.dart';
import 'package:client_order/widgets/menu_page/manu_bar_list.dart';
import 'package:flutter/material.dart';

import 'main_menu_list.dart';

class MainMenuPage extends StatefulWidget {
  final int currentCategorySelected;
  final int currentCategoryPageSelected;
  final List<ProductItem> lstProductItem;
  final Function(int) tapMenubar;

  const MainMenuPage(
      {Key? key,
      required this.currentCategorySelected,
      required this.lstProductItem,
      required this.tapMenubar,
      required this.currentCategoryPageSelected})
      : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int currentMenuId = 0;

  void clickMenuItem(int pageId, int menuId) {
    setState(() {
      currentMenuId = menuId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 50,
            child: CategoryMenuBar(
              currentCategory: widget.currentCategorySelected,
              tapMenubar: widget.tapMenubar,
              productItem: widget.lstProductItem,
            )),
        Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 500,
            child: MainMenu(
              lstMenu: widget.lstProductItem,
              currentCategoryAndPage: clickMenuItem,
              currentPage: widget.currentCategoryPageSelected,
            ))
      ],
    );
  }
}

//
// class MainMenuPage extends StatelessWidget {
//   final int currentCategorySelected;
//   final Function(int, int) clickMenuBarPage;
//   final List<ProductItem> lstProductItem;
//
//   const MainMenuPage(
//       {Key? key,
//       required this.currentCategorySelected,
//       required this.clickMenuBarPage,
//       required this.lstProductItem})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             alignment: Alignment.topCenter,
//             width: double.infinity,
//             height: 50,
//             child: CategoryMenuList(
//               currentCategory: currentCategorySelected,
//               menuItemTap: clickCategoryItem,
//             )),
//         Container(
//             alignment: Alignment.topCenter,
//             width: double.infinity,
//             height: 500,
//             child: MainMenu(
//               lstMenu: DUMMY_PRODUCT,
//             ))
//       ],
//     );
//   }
// }
