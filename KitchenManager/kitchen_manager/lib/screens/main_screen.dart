import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../models/cart_item_model.dart';
import '../models/table_item_model.dart';
import '../providers/table_providers.dart';
import '../widgets/list_checker.dart';

class MainScreen extends StatefulWidget {
  final AppBar appBar;

  const MainScreen({required this.appBar, Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TableItem> tableItems = [];
  late StompClient stompClient;

  @override
  void initState() {
    super.initState();

    stompClient = StompClient(
        config: StompConfig.SockJS(
      url:
          'http://${GlobalConfiguration().get("server_endpoint")}/gs-guide-websocket',
      onConnect: onConnect,
      onWebSocketError: (dynamic error) => print(error.toString()),
    ));
    stompClient.activate();
  }

  void onConnect(StompFrame frame) {
    dynamic result;
    print("WebSocket");
    stompClient.subscribe(
        destination: '/topic/ordering',
        callback: (frame) {

          result = json.decode(frame.body!);
          List<CartItem> tempCartItemList = [];
          for (var cart in result['items']) {
            CartItem cartItem = CartItem.fromJson(cart);
            tempCartItemList.add(cartItem);
          }
          Provider.of<TableProvider>(context, listen: false).addItem(TableItem(
              result['orderInfoId'],
              result['tableName'],
              'Cook',
              tempCartItemList));
          FlutterRingtonePlayer.playNotification();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TableProvider>(
      builder: (ctx, table, _) => Row(
        children: [
          Expanded(
            child: ListChecker(
              appBar: widget.appBar,
              columnNumber: 0,
              tableItem: table.tableItems[0],
            ),
          ),
          Expanded(
            child: ListChecker(
              appBar: widget.appBar,
              columnNumber: 1,
              tableItem: table.tableItems[1],
            ),
          ),
          Expanded(
            child: ListChecker(
              appBar: widget.appBar,
              columnNumber: 2,
              tableItem: table.tableItems[2],
            ),
          ),
          Expanded(
            child: ListChecker(
              appBar: widget.appBar,
              columnNumber: 3,
              tableItem: table.tableItems[3],
            ),
          ),
        ],
      ),
    );
    // builder: (ctx, table, _) => Table(
    //   border: TableBorder.all(),
    //   children: [
    //     TableRow(
    //       children: [
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 0,
    //           tableItem: table.tableItems[0],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 1,
    //           tableItem: table.tableItems[1],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 2,
    //           tableItem: table.tableItems[2],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 3,
    //           tableItem: table.tableItems[3],
    //         )
    //       ],
    //     ),
    //   ],
    // ),
    // );

    // final tableProvider = Provider.of<TableProvider>(context, listen: true);
    // tableItems = tableProvider.items;
    // return Table(
    //   border: TableBorder.all(),
    //   children: [
    //     TableRow(
    //       children: [
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 0,
    //           tableItem: tableItems[0],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 1,
    //           tableItem: tableItems[1],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 2,
    //           tableItem: tableItems[2],
    //         ),
    //         ListChecker(
    //           appBar: widget.appBar,
    //           columnNumber: 3,
    //           tableItem: tableItems[3],
    //         )
    //       ],
    //     ),
    //   ],
    // );
  }
}
