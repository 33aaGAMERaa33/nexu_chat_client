import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/request_dto.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';

final class PedidosPendentesViewController with StateIsLoading{
  List<PedidoContatoModel> pedidos = [];
  final ValueNotifier<String?> pedidoUUIDSelecionado = ValueNotifier(null);

  Future<void> buscarPedidos() async{
    isLoading.value = true;

    final dto = ObterPedidosContatoRequestDto();
    final resposta = await ContactRequestsController.fetch(ObterPedidosContatoMethod(dto));

    if(resposta is PedidosPendentesDto){
      pedidos = resposta.pedidos;
    }

    isLoading.value = false;
  }
}