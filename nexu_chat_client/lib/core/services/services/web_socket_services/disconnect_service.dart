import 'package:nexu_chat_client/core/controllers/controllers/users/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/logout/method.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/services/service_web_socket.dart';

final class DisconnectService {
  static void _handler(EventPostRequest<UsersController> event){
    if(event.isLoading && event.method is LogoutMethod){
      ServiceWebSocket.disconnect();
    }
  }
  static void init(){
    EventManager.addListener<EventPostRequest<UsersController>>(_handler);
  }
}