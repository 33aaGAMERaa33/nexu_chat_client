import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/features/conversa/conversa_view.dart';
import 'package:nexu_chat_client/main.dart';
import 'package:nexu_chat_client/utils/enum_contact_status.dart';

final class MensagemRecebidaPopUpController {
  final MensagemModel mensagem;
  MensagemRecebidaPopUpController(this.mensagem);

  void irParaChat(BuildContext context){
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();

    WidgetsBinding.instance.addPostFrameCallback((_){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ConversaView(ContatoModel(
          uuid: mensagem.sender.uuid,
          username: mensagem.sender.username,
          email: mensagem.sender.email,
          contactUUID: mensagem.contactUUID,
          status: ContactStatus.active,
        ));
      },));
    });
  }
}