import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/features/conversa/campo_mensagem/campo_mensagem_widget.dart';
import 'package:nexu_chat_client/features/conversa/conversa_view_controller.dart';
import 'package:nexu_chat_client/features/conversa/lista_mensagens/lista_mensagens_widget.dart';

final class ConversaView extends StatelessWidget{
  final ConversaViewController viewController;
  ConversaView(ContatoModel contato, {super.key}) : viewController = ConversaViewController(contato);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewController.contato.username),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListaMensagensWidget(viewController.contato),
          ),
          CampoMensagemWidget(viewController.contato),
        ],
      ),
    );
  }
}