import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/dto/obter_contatos_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/utils/status_requests_contact.dart';
import 'package:nexu_chat_client/core/services/core/dto.dart';

class ObterPedidosContatoPorDadosDto extends Dto{
  final String ? username;
  final StatusRequestsContact ? statusPedidosContato;
  final int pag;

  ObterPedidosContatoPorDadosDto({
    this.username,
    this.statusPedidosContato,
    this.pag = 1
  });

  @override
  Map<String, dynamic> ? data() {
    return {
      "username": username,
      "status": statusPedidosContato.toString().split(".")[1],
      "pag": pag
    };
  }
}