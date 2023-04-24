import 'package:flutter/material.dart';

class TableItemWidget extends StatelessWidget {
  final String tableName;

  const TableItemWidget({required this.tableName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: SizedBox(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.blue),
          child: Text(
            tableName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
