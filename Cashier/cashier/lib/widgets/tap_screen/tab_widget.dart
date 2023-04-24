import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  final Function setState;

  const TabScreen({required this.setState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => setState(1),
          child: Text('Table Screen'),
        ),
        TextButton(
          onPressed: () => setState(2),
          child: Text('Summary Screen'),
        ),
      ],
    );
  }
}
