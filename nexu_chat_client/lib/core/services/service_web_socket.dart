  import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_contact_request_processed.dart';
  import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
  import 'package:nexu_chat_client/core/event/events/event_web_socket_connected.dart';
  import 'package:nexu_chat_client/core/http_request_api/http_request_api.dart';
  import 'package:nexu_chat_client/core/services/core/controllers/user_controller/methods/login_controller.dart';
  import 'package:nexu_chat_client/core/services/core/controllers/user_controller/methods/logout_controller.dart';
  import 'package:nexu_chat_client/core/services/core/controllers/user_controller/users_controller.dart';
  import 'package:socket_io_client/socket_io_client.dart' as IO;

  import '../event/events/event_web_scoket_disconnected.dart';

  class ServiceWebSocket {
    // Singleton correto
    static final ServiceWebSocket _instance = ServiceWebSocket._();
    factory ServiceWebSocket() => _instance;
    ServiceWebSocket._();

    static final IO.Socket _socket = IO.io("$serverUrl:$serverPort", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    static void init() {
      _socket.onConnect((_) {
        EventManager.dispararEvento<EventWebSocketConnected>(EventWebSocketConnected());
      });

      _socket.onDisconnect((_) {
        EventManager.dispararEvento<EventWebSocketDisconnected>(EventWebSocketDisconnected());
      });

      _socket.on("contact_request_processed", (message){
        print(message);
        EventManager.dispararEvento<EventContactRequestProcessed>(EventContactRequestProcessed(
          contactRequestId: message["id_request"],
          username: message["username"],
          email: message["email"],
          status: message["status"],
        ));
      });

      EventManager.adicionarOuvinte<EventPostRequest<UserController>>(_connect);
      EventManager.adicionarOuvinte<EventPostRequest<UserController>>(_disconnect);
    }

    static void dispose() {
      EventManager.removerOuvinte<EventPostRequest<UserController>>(_connect);
      EventManager.removerOuvinte<EventPostRequest<UserController>>(_disconnect);
    }

    static void _connect(EventPostRequest<UserController> event) {
      if (!event.isLoading && event.controller is LoginController) {
        if (event.response?.data["status"] == "success") {
          if (!_socket.connected) {
            final token = event.response?.data["token"];

            _socket.io.options?['query'] = {'token': token};
            _socket.connect();
          }
        }
      }
    }

    static void _disconnect(EventPostRequest<UserController> event) {
      if (!event.isLoading && event.controller is LogoutController) {
        if (event.response?.data["status"] == "success") {
          if (_socket.connected) {
            _socket.disconnect();
          }
        }
      }
    }
  }
