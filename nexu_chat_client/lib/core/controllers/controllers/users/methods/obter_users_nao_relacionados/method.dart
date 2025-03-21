import 'package:nexu_chat_client/core/controllers/controllers/users/methods/obter_users_nao_relacionados/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/obter_users_nao_relacionados/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class ObterUsersNaoRelacionadosMethod extends Method<UsersController>{
  final ObterUsersNaoRelacionadosRequestDTO _dto;

  ObterUsersNaoRelacionadosMethod(this._dto) : super(
    controller: UsersController(),
    httpMethod: HTTPMethods.post,
    method: "obter-users-nao-relacionados",
    needToken: true,
  );

  @override
  RequestDto get dto => _dto;
  @override
  ResponseDtoAdapter get dtoAdapter => ObterUsersNaoRelacionadosResponseDtoAdapter();
}