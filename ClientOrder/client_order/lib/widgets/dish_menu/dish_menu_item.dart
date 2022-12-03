import 'package:flutter/material.dart';

class ProductMenuItem extends StatelessWidget {
  final int id;
  final String name;

  const ProductMenuItem({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange.withOpacity(0.7),
              Colors.deepOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
