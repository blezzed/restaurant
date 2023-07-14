
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/pages/receipts/index.dart';
import 'package:restaurant/pages/sign_in/index.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ReceiptsController extends GetxController{
  ReceiptsController();
  final state = ReceiptsState();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  static final _endpoint = dotenv.get('WEBSOCKET_HOST', fallback: 'ws://localhost:8080/ws');

  late final WebSocketChannel? channel;
  TextEditingController? textController= TextEditingController();


  void sendMessage() {
    if (textController!.text.isNotEmpty) {
      channel!.sink.add(textController!.text);
    }

  }

  @override
  void onInit() {
    super.onInit();
    print(_endpoint);
    channel = WebSocketChannel.connect(
      Uri.parse('$_endpoint'),
    );
  }


  @override
  void dispose() {

    channel!.sink.close();
    super.dispose();
  }
}