import 'package:nexu_chat_client/core/controllers/controllers/users/methods/register/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/register/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class RegisterMethod extends Method<UsersController>{
  final RegisterRequestDTO _dto;

  RegisterMethod(this._dto) : super(
    method: "register",
    controller: UsersController(),
    needToken: false,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => _dto;
  @override
  ResponseDtoAdapter get dtoAdapter => RegisterResponseDtoAdapter();
}