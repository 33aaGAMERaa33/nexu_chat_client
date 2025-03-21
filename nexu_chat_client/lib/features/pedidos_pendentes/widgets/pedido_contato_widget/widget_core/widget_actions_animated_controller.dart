import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/processar_pedido_contato/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/processar_pedido_contato/request_dto.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';

import '../../../../../core/models/pedido_contato_model.dart';

final class WidgetActionsAnimatedController with StateIsLoading{
  final PedidoContatoModel pedidoContato;
  final ValueNotifier<String?> pedidoUUIDSelecionado;
  final animationDuration = const Duration(milliseconds: 100);
  bool selected = false;
  bool _processed = false;

  bool get stateTrue => selected && thisSelected;
  bool get thisSelected => pedidoUUIDSelecionado.value == pedidoContato.pedidoUUID;
  bool get isProcessed => _processed;
  WidgetActionsAnimatedController(this.pedidoContato, this.pedidoUUIDSelecionado);

  Future<void> processarPedido(TipoProcessoPedidoContato tipoProcesso) async{
    if(!isLoading.value && !_processed){
      isLoading.value = true;

      final dto = ProcessarPedidoContatoRequestDto(
        pedidoContatoUUID: pedidoContato.pedidoUUID,
        tipoProcesso: tipoProcesso
      );
      final resposta = await ContactRequestsController.fetch(ProcessarPedidoContatoMethod(dto));

      isLoading.value = false;
      _processed = true;
    }
  }
}