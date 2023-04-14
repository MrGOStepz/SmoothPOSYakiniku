import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/table_item_model.dart';
import '../providers/table_providers.dart';

class HeadColumnTable extends StatefulWidget {
  final AppBar appBar;
  final TableItem tableItem;
  final int columnNumber;

  const HeadColumnTable(
      {required this.appBar,
      required this.tableItem,
      required this.columnNumber,
      Key? key})
      : super(key: key);

  @override
  State<HeadColumnTable> createState() => _HeadColumnTableState();
}

class _HeadColumnTableState extends State<HeadColumnTable> {
  void getNextTable() {
    setState(() {
      Provider.of<TableProvider>(context, listen: false)
          .cleanTable(widget.columnNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double heightSize = (mediaQuery.size.height -
            widget.appBar.preferredSize.height -
            mediaQuery.padding.top) *
        0.1;
    return Card(
      child: InkWell(
        onTap: null,
        child: SizedBox(
          height: heightSize,
          width: double.infinity,
          child: Column(
            children: [
              Text(widget.tableItem.tableName as String),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: const Text('Call'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: getNextTable,
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: const Text('Done'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
