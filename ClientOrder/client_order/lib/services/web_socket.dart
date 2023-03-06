import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

String url = 'http://localhost:8080/gs-guide-websocket';

void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/topic/ordering',
    callback: (frame) {
      dynamic result = json.decode(frame.body!);
      debugPrint(result.toString());
    },
  );

  // Timer.periodic(Duration(seconds: 10), (_) {
  //   stompClient.send(
  //     destination: '/app/test/endpoints',
  //     body: json.encode({'a': 123}),
  //   );
  // });
}

final stompClient = StompClient(
  config: StompConfig.SockJS(
    url: url,
    onConnect: onConnect,
    onWebSocketError: (dynamic error) => debugPrint(error.toString()),
  ),
);

void main() {
  stompClient.activate();
}
