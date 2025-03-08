import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/processar_pedido_contato_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/methods/processar_pedido_contato_controller.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/requests_contact_controller.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';
import 'package:nexu_chat_client/core/show_progress_indicator.dart';


class ContactRequestDecisionAlertDialogController {
  final Map requestDados;
  final ValueNotifier<EnumTiposParaProcessarPedido?> decisao = ValueNotifier(null);

  ContactRequestDecisionAlertDialogController(this.requestDados);

  void enviarDecisao(BuildContext context) async{
    if(decisao.value != null){
      showProgressIndicator(context, barrierDismissible: false);

      final processarPedidoContatoDto = ProcessarPedidoContatoDto(
        pedidoContatoId: requestDados["contact_request_id"],
        tipo: decisao.value!,
      );

      final resposta = await ServiceRequest.fetch<RequestsContactController>(ProcessarPedidoContatoController(
          processarPedidoContatoDto
      ));

      if(context.mounted){
        Navigator.pop(context);
        Navigator.pop(context);
      }
    }
  }
}
