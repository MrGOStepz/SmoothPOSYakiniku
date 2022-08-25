import 'package:flutter/material.dart';

void main() {
  runApp(const OrderApp());
}

class OrderApp extends StatelessWidget {
  const OrderApp({Key? key}) : super(key: key);
  final String titleName = 'Client Order';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderHomePage(title: titleName),
    );
  }
}

class OrderHomePage extends StatefulWidget {
  const OrderHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OrderHomePage> createState() => _OrderHomePageState();
}

class _OrderHomePageState extends State<OrderHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Table(border: TableBorder.all(), children: [
          TableRow(children: )
        ],),

      ),
    );
  }
}
