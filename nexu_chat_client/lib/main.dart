import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/core/services/service_web_socket.dart';
import 'package:nexu_chat_client/core/services/services/user_logged_service.dart';
import 'package:nexu_chat_client/core/services/services/web_socket_services/connect_service.dart';
import 'package:nexu_chat_client/core/services/services/web_socket_services/disconnect_service.dart';
import 'package:nexu_chat_client/core/services/services/web_socket_services/mensagem_recebida_service.dart';
import 'package:nexu_chat_client/features/auth/login/login_view.dart';
import 'package:nexu_chat_client/utils/global_context.dart';
import 'core/http_request_api.dart';

const nomeApp = "Nexu Chat";
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HttpRequestApi().init();

  _initServices();

  runApp(const MyApp());
}

void _initServices(){
  UserLoggedService.init();
  ServiceWebSocket.init();
  MensagemRecebidaService.init();
  ConnectService.init();
  DisconnectService.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nomeApp,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (context) {
            return LoginView();
          },
          settings: settings
        );
      },
    );
  }
}