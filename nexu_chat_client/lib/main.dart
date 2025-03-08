import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/core/services/core/services/connected_service.dart';
import 'package:nexu_chat_client/core/services/core/services/contact_request_processed_service.dart';
import 'package:nexu_chat_client/core/services/core/services/desconnected_service.dart';
import 'package:nexu_chat_client/core/services/service_web_socket.dart';
import 'package:nexu_chat_client/features/session/session_view.dart';

import 'core/http_request_api/http_request_api.dart';

const nomeApp = "Nexu Chat";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HttpRequestApi().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    if (!_initialized) {
      // Coloque suas inicializações aqui
      UserModel.init();
      ServiceWebSocket.init();
      ContactRequestProcessedService.init();
      ConnectedService.init();
      DesconnectedService.init();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nomeApp,
      theme: ThemeData.dark(),
      home: SessionView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
