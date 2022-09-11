import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductMenuItem extends StatelessWidget {
  final ProductItem productItem;
  const ProductMenuItem({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: InkWell(
        onTap: () => null,
        child: Text(productItem.name),
      ),
    );
  }
}
