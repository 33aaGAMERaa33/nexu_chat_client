import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/dto/obter_contatos_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/obter_pedidos_contato_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/processar_pedido_contato_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/methods/obter_pedidos_contato_por_dados.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/requests_contact_controller.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/utils/status_requests_contact.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';
import 'package:nexu_chat_client/core/state_is_loading.dart';

class PedidosContatoViewController with StateIsLoading{
  final _tempoEsperaBusca = const Duration(seconds: 1);
  List pedidos = [];

  void buscarPedidosContato() async{
    isLoading.value = true;

    final obterContatosPorDadosDto = ObterPedidosContatoPorDadosDto(
      statusPedidosContato: StatusRequestsContact.pending
    );

    final resposta = await ServiceRequest.fetch<RequestsContactController>(ObterPedidosContatoPorDadosController(
        obterContatosPorDadosDto
    ));

    if(resposta.data["status"] == "success"){
      pedidos = resposta.data["requests"];
    }

    isLoading.value = false;
  }
}