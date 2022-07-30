import 'package:flutter/material.dart';

void main() {
  runApp(const KitchenManager());
}

class KitchenManager extends StatelessWidget {
  const KitchenManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Manager',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MainHomePage(title: 'Kitchen Manager'),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final AppBar appBar = AppBar(
      title: Text(widget.title),
    );
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.9,
      child: ListView(
        children: [
          Text('Order 2'),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Table(border: TableBorder.all(), children: [
          TableRow(
            children: [
              Column(
                children: [
                  Card(
                    child: Container(
                        height: (mediaQuery.size.height -
                                appBar.preferredSize.height -
                                mediaQuery.padding.top) *
                            0.1,
                        width: double.infinity,
                        child: Text('Table 1')),
                  ),
                  txListWidget,
                ],
              ),
              Text('Table 2'),
              Text('Table 3'),
              Text('Table 4'),
            ],
          ),
        ]),
      ),
    );
  }
}
