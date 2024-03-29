import 'package:flutter/material.dart';

import '../widgets/summary_screen/summary_screen.dart';
import '../widgets/table_screen/table_widget.dart';
import '../widgets/tap_screen/tab_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _state = 1;

  void _changeScreen(int state) {
    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: TabScreen(setState: _changeScreen,  ),
        ),
        if (_state == 1)
          Expanded(
            flex: 8,
            child: TableScreen(),
          )
        else
          Expanded(
            flex: 8,
            child: SummaryScreen(),
          )
      ],
    );
  }
}
