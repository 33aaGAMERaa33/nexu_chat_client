import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/request_dto.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';

final class CampoMensagemWidgetController {
  final ContatoModel contato;
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final mensagensController = TextEditingController();
  CampoMensagemWidgetController(this.contato);

  Future<void> enviarMensagem() async{
    final message = mensagensController.text.trim();
    mensagensController.text = "";
    focusNode.requestFocus();

    if(message.isNotEmpty){
      final dto = EnviarMensagemRequestDto(
        receiverUUID: contato.uuid,
        message: message,
        type: MensagemType.text
      );

      final resposta = await MessagesController.fetch(EnviarMensagemMethod(dto));
    }
  }
}