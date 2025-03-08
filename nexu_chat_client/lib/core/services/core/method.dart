import 'dart:io';

import 'package:nexu_chat_client/core/http_request_api/http_request_api.dart';

import 'controller.dart';

class Method<T extends Controller> {
  final T controller;
  final String method;
  final HTTPMethods httpMethod;
  late final String url;
  final bool needToken;

  Method({
    required this.controller,
    required this.method,
    required this.httpMethod,
    required this.needToken,
  }){
    url = "$serverUrl:$serverPort/${controller.controller}/$method";
  }

  Map<String, dynamic> buildData(){
    return {};
  }
  @override
  String toString() {
    return "$controller | Method: $method";
  }
}