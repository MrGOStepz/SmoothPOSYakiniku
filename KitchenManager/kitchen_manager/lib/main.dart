import 'package:flutter/material.dart';
import 'package:kitchen_manager/models/table_detail.dart';
import 'package:kitchen_manager/providers/table_providers.dart';
import 'package:kitchen_manager/services/product_service.dart';
import 'package:kitchen_manager/widgets/list_checker.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const KitchenManager());
}

class KitchenManager extends StatelessWidget {
  const KitchenManager({Key? key}) : super(key: key);

  // Future<void> rsocket() async {
  //   const listenUrl = 'tcp://0.0.0.0:42252';
  //   var closeable = await RSocketServer.create(requestResponseAcceptor((payload) {
  //     return Future.value(Payload.fromText('text/plain', 'Pong'));
  //   })).bind(listenUrl);
  //   print('RSocket Server started on ${listenUrl}');
  // }

  @override
  Widget build(BuildContext context) {
    // rsocket();
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

class _MainHomePageState extends State<MainHomePage>
    with WidgetsBindingObserver {
  final List<TableItem> tableDetails = [];

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(widget.title),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TableProvider()),
      ],
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Table(border: TableBorder.all(), children: [
            TableRow(
              children: [
                ListChecker(
                  appBar: appBar,
                  columnNumber: 1,
                ),
                ListChecker(
                  appBar: appBar,
                  columnNumber: 2,
                ),
                ListChecker(
                  appBar: appBar,
                  columnNumber: 3,
                ),
                Text('Table 4') // TODO Clean List,
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
