import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/obter_pedidos_contato_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/processar_pedido_contato_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/requests_contact_controller.dart';

import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';

class ProcessarPedidoContatoController extends Method<RequestsContactController>{
  static final _instance = ProcessarPedidoContatoController._();
  static late ProcessarPedidoContatoDto _processarPedidoContatoDto;

  ProcessarPedidoContatoController._() : super(
      controller: RequestsContactController(),
      method: "process_contact_request",
      httpMethod: HTTPMethods.post,
      needToken: true
  );

  factory ProcessarPedidoContatoController(ProcessarPedidoContatoDto processarPedidoContatoDto){
    _processarPedidoContatoDto = processarPedidoContatoDto;
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _processarPedidoContatoDto.data()!;
  }
}