import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../../controller.dart';

final class EnviarMensagemMethod extends Method<MessagesController>{
  final EnviarMensagemRequestDto _dto;

  EnviarMensagemMethod(this._dto) : super(
    method: "enviar-mensagem",
    controller: MessagesController(),
    needToken: true,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => _dto;
  @override
  ResponseDtoAdapter get dtoAdapter => ResponseDtoAdapter.static();
}