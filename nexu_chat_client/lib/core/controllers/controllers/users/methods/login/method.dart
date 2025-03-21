import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class LoginMethod extends Method<UsersController>{
  final LoginRequestDTO _dto;

  LoginMethod(this._dto) : super(
    method: "login",
    controller: UsersController(),
    needToken: false,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => _dto;

  @override
  ResponseDtoAdapter get dtoAdapter => LoginResponseDtoAdapter();
}