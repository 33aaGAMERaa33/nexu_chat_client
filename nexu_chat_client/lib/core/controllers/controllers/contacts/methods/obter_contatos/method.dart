import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class ObterContatosMethod extends Method<ContactsController>{
  final ObterContatosRequestDto _dto;

  ObterContatosMethod(this._dto) : super(
    method: "obter-contatos",
    controller: ContactsController(),
    needToken: true,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => _dto;
  @override
  ResponseDtoAdapter get dtoAdapter => ObterContatosResponseDtoAdapter();
}