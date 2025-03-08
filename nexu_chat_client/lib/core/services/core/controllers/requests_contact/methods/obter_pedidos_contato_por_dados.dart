import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/obter_pedidos_contato_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/requests_contact_controller.dart';

import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';

class ObterPedidosContatoPorDadosController extends Method<RequestsContactController>{
  static final _instance = ObterPedidosContatoPorDadosController._();
  static late ObterPedidosContatoPorDadosDto _obterPedidosContatoPorDadosDto;

  ObterPedidosContatoPorDadosController._() : super(
    controller: RequestsContactController(),
    method: "obter-pedidos-contato-por-dados",
    httpMethod: HTTPMethods.post,
    needToken: true
  );

  factory ObterPedidosContatoPorDadosController(ObterPedidosContatoPorDadosDto obterPedidosContatoPorDadosDto){
    _obterPedidosContatoPorDadosDto = obterPedidosContatoPorDadosDto;
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _obterPedidosContatoPorDadosDto.data()!;
  }
}