import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/method.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/services/service_web_socket.dart';

import '../../../controllers/controllers/users/controller.dart';

final class ConnectService {
  static void _handler(EventPostRequest<UsersController> event) async{
    if(!event.isLoading && event.method is LoginMethod){
      final dto = event.responseDto;

      if(dto is LoginResponseDTO){
        final token = dto.token;
        ServiceWebSocket.dispose();
        ServiceWebSocket.init();

        ServiceWebSocket.setToken(token);
        await ServiceWebSocket.connect(reconnectIfConnected: true);
      }
    }
  }
  static void init(){
    EventManager.addListener<EventPostRequest<UsersController>>(_handler);
  }
}