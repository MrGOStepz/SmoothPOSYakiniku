import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';

class HeadColumnTable extends StatefulWidget {
  final AppBar appBar;
  final TableDetail tableDetail;
  final Function addNewTable;
  final int columnNumber;

  const HeadColumnTable({required this.appBar, required this.tableDetail, required this.addNewTable, required this.columnNumber,Key? key})
      : super(key: key);

  @override
  State<HeadColumnTable> createState() => _HeadColumnTableState();
}

class _HeadColumnTableState extends State<HeadColumnTable> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      child: SizedBox(
          height: (mediaQuery.size.height -
              widget.appBar.preferredSize.height -
              mediaQuery.padding.top) *
              0.1,
          width: double.infinity,
          child: Column(
            children: [
              Text(widget.tableDetail.tableName),
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
                        // onPressed: null,
                        onPressed: widget.addNewTable(widget.columnNumber),
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



// class HeadColumn extends StatelessWidget {
//   final AppBar appBar;
//   final TableDetail tableDetail;
//   final Function addNewTable;
//   final int columnNumber;
//
//   const HeadColumn({required this.appBar, required this.tableDetail, required this.addNewTable, required this.columnNumber,Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Card(
//       child: SizedBox(
//           height: (mediaQuery.size.height -
//                   appBar.preferredSize.height -
//                   mediaQuery.padding.top) *
//               0.1,
//           width: double.infinity,
//           child: Column(
//             children: [
//               Text(tableDetail.tableName),
//               Row(
//                 children: [
//                   Expanded(
//                       flex: 1,
//                       child: TextButton(
//                         onPressed: null,
//                         style: TextButton.styleFrom(
//                           primary: Colors.blue,
//                         ),
//                         child: const Text('Call'),
//                       )),
//                   Expanded(
//                       flex: 1,
//                       child: TextButton(
//                         onPressed: null,
//                         // onPressed: addNewTable(columnNumber),
//                         style: TextButton.styleFrom(
//                           primary: Colors.blue,
//                         ),
//                         child: const Text('Done'),
//                       ))
//                 ],
//               )
//             ],
//           )),
//     );
//   }
// }
