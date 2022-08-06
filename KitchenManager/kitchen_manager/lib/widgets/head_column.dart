import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';

class HeadColumn extends StatelessWidget {
  final AppBar appBar;
  final TableDetail tableDetail;

  const HeadColumn({required this.appBar, required this.tableDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      child: SizedBox(
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.1,
          width: double.infinity,
          child: Column(
            children: [
              Text(tableDetail.tableName),
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
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        child: const Text('Done'),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
