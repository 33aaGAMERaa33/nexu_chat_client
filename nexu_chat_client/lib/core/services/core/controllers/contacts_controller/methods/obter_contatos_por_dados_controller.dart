import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/contacts_controller.dart';
import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/dto/obter_contatos_por_dados_dto.dart';

import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';

class ObterContatosPorDadosController extends Method<ContactsController>{
  static final _instance = ObterContatosPorDadosController._();
  static late ObterContatosPorDadosDto _obterContatosPorDadosDto;

  ObterContatosPorDadosController._() : super(
      controller: ContactsController(),
      method: "obter-contatos-por-dados",
      httpMethod: HTTPMethods.post,
      needToken: true
  );

  factory ObterContatosPorDadosController(ObterContatosPorDadosDto obterContatosPorDadosDto){
    _obterContatosPorDadosDto = obterContatosPorDadosDto;
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _obterContatosPorDadosDto.data()!;
  }
}