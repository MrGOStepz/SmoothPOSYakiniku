import 'package:client_order/models/product_model.dart';
import 'package:flutter/cupertino.dart';

import 'category_menu_item.dart';

class CategoryMenu extends StatelessWidget {
  final Function(int) selectCategory;
  final List<Category> lstCategory;

  const CategoryMenu({required this.selectCategory, Key? key, required this.lstCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: lstCategory
          .map((item) => CategoryMenuItem(
                key: ValueKey(item.id),
                selectCategory: selectCategory,
                category: item,
              ))
          .toList(),
    );
  }
}
