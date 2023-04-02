import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:provider/provider.dart';

class HeadColumnTable extends StatefulWidget {
  final AppBar appBar;
  final TableItem tableItem;
  final int columnNumber;
  final VoidCallback getNextOrder;

  const HeadColumnTable(
      {required this.appBar,
      required this.tableItem,
      required this.columnNumber,
      required this.getNextOrder,
      Key? key})
      : super(key: key);

  @override
  State<HeadColumnTable> createState() => _HeadColumnTableState();
}

class _HeadColumnTableState extends State<HeadColumnTable> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double heightSize = (mediaQuery.size.height -
            widget.appBar.preferredSize.height -
            mediaQuery.padding.top) *
        0.1;
    return Card(
      child: InkWell(
        onTap: widget.getNextOrder,
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
                      onPressed: () =>
                          Provider.of<TableProvider>(context, listen: false)
                              .initMock(),
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
