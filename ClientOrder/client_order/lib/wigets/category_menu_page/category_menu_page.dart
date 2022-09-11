import 'package:client_order/models/product_model.dart';
import 'package:flutter/cupertino.dart';

import 'category_menu_item.dart';

class CategoryMenu extends StatelessWidget {
  final Function(int) tap;

  const CategoryMenu({required this.tap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: DUMMY_CATEGORY
          .map((item) => CategoryMenuItem(
                key: ValueKey(item.id),
                tap: tap,
                category: item,
              ))
          .toList(),
    );
  }
}
