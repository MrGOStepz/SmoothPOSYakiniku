import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';

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
  final List<TableDetail> tableDetails = [
    new TableDetail(id: 1, status: "Waiting", orders: ["Beef 50", "Rice 20"]),
    new TableDetail(id: 2, status: "Waiting", orders: ["Beef 70", "Rice 10"]),
  ];

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
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              title: Text("Beef 50"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme
                    .of(context)
                    .errorColor,
                onPressed: () => null,
              ),
            ),
          );
        },
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
                        child: Column(
                          children: [
                            Text('Table'),
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
