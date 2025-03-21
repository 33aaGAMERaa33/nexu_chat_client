import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/models/user_logged_model.dart';

import '../../controllers/controllers/users/methods/login/dto.dart';
import '../../controllers/controllers/users/methods/login/method.dart';
import '../../controllers/controllers/users/controller.dart';

final class UserLoggedService {
  static void _handler(EventPostRequest<UsersController> event){
    if(!event.isLoading && event.method is LoginMethod && event.responseDto is LoginResponseDTO){
      LoginResponseDTO dto = event.responseDto;

      UserLoggedModel.createNew(
        uuid: dto.uuid,
        username: dto.username,
        email: dto.email,
        token: dto.token
      );
    }
  }
  static void init(){
    EventManager.addListener<EventPostRequest<UsersController>>(_handler);
  }
  static void dispose(){
    EventManager.removeListener<EventPostRequest<UsersController>>(_handler);
  }
}