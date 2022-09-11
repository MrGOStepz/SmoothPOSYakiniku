import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class CategoryMenuItem extends StatelessWidget {
  final Category category;
  final Function(int) tap;

  const CategoryMenuItem({required this.category, required this.tap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: InkWell(
        onTap: () => tap(category.id),
        child: Text(category.name),
      ),
    );
  }
}