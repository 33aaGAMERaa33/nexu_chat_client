import 'package:nexu_chat_client/core/http_request_api/http_request_api.dart';

class Controller {
  final String controller;
  Controller(this.controller);

  String buildUrl(String method){
    return "$serverUrl:$serverPort/$controller/$method";
  }

  @override
  String toString() {
    return "Controller: $controller";
  }
}