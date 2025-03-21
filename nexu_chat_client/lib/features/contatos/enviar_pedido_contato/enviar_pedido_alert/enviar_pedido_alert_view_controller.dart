import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/enviar_pedido_contato/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/enviar_pedido_contato/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/main.dart';
import 'package:nexu_chat_client/utils/show_progress_indicator.dart';

final class EnviarPedidoAlertViewController {
  final UserModel user;
  EnviarPedidoAlertViewController(this.user);

  void enviarPedido(BuildContext context) async{
    showProgressIndicator(context, barrierDismissible: true);

    final dto = EnviarPedidoContatoRequestDTO(user.uuid);
    final resposta = await ContactRequestsController.fetch(EnviarPedidoContatoMethod(dto));

    if(context.mounted){
      Navigator.pop(context);
      Navigator.pop(context);

      if(resposta is Dto){
        scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
            content: Text(resposta.message)
        ));
      }
    }
  }
}