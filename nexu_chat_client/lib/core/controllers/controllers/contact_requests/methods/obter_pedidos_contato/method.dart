import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/enviar_pedido_contato/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/login/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';


final class ObterPedidosContatoMethod extends Method<ContactRequestsController>{
  final ObterPedidosContatoRequestDto _dto;

  ObterPedidosContatoMethod(this._dto) : super(
    method: "obter-pedidos-contato",
    controller: ContactRequestsController(),
    needToken: true,
    httpMethod: HTTPMethods.post,
  );

  @override
  RequestDto get dto => _dto;
  @override
  ResponseDtoAdapter get dtoAdapter => PedidosPendentesResponseDtoAdapter();
}