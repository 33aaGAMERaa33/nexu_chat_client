import 'dart:io';

import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import 'controller.dart';
import 'request_dto.dart';

abstract class Method<T extends Controller> {
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

  RequestDto get dto;
  ResponseDtoAdapter get dtoAdapter;

  @override
  String toString() {
    return "$controller | Method: $method";
  }
}