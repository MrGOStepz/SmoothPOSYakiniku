import 'package:flutter/material.dart';

import '../widgets/list_checker.dart';

class MainScreen extends StatefulWidget {
  final AppBar appBar;

  const MainScreen({required this.appBar, Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Table(border: TableBorder.all(), children: [
      TableRow(
        children: [
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 1,
          ),
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 2,
          ),
          ListChecker(
            appBar: widget.appBar,
            columnNumber: 3,
          ),
          Text('Table 4') // TODO Clean List,
        ],
      ),
    ]);
  }
}
