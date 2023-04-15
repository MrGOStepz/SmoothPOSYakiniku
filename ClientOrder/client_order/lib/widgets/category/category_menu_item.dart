import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import '../../models/category_model.dart';

class CategoryMenuItem extends StatelessWidget {
  final Category category;
  final Function(int) selectCategory;

  const CategoryMenuItem(
      {required this.category, required this.selectCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.network('http://${GlobalConfiguration().get("server_endpoint")}/images/${category.imagePath}',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,),
        ),
        Container(
          // elevation: 5,
          // margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => selectCategory(category.id),
            child: Text(category.name),
          ),
        ),
      ],
    );
  }
}
