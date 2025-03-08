import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';

import '../services/core/controllers/user_controller/methods/login_controller.dart';
import '../services/core/controllers/user_controller/users_controller.dart';

class UserModel {
  static final _instance = UserModel._();
  static String ? username;
  static String ? email;
  static String ? token;
  UserModel._();

  static void _handler(EventPostRequest<UserController> event){
    if(!event.isLoading && event.response?.data["status"] == "success" && event.controller == LoginController()){
      username = event.response?.data["data"]["username"];
      email = event.response?.data["data"]["email"];
      token = event.response?.data["token"];
    }
  }
  static void init(){
    EventManager.adicionarOuvinte<EventPostRequest<UserController>>(_handler);
  }
  static void dispose(){
    EventManager.removerOuvinte<EventPostRequest<UserController>>(_handler);
  }

  static String toString_() {
    return "Username: $username | Email: $email | Token: $token";
  }
}