import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class LogoutMethod extends Method<UsersController>{
  LogoutMethod() : super(
    method: "logout",
    controller: UsersController(),
    needToken: true,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => RequestDto.static();
  @override
  ResponseDtoAdapter get dtoAdapter => ResponseDtoAdapter.static();
}