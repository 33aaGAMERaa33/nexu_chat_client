import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/features/conversa/campo_mensagem/campo_mensagem_widget_controller.dart';

final class CampoMensagemWidget extends StatelessWidget{
  final CampoMensagemWidgetController widgetController;
  CampoMensagemWidget(ContatoModel contato, {super.key}) : widgetController = CampoMensagemWidgetController(contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: widgetController.formKey,
          child: _campoMensagem(),
        ),
      ),
    );
  }
  Widget _campoMensagem(){
    return TextFormField(
      focusNode: widgetController.focusNode,
      controller: widgetController.mensagensController,
      decoration: InputDecoration(
          labelText: "Mensagem",
          suffixIcon: _suffixIcon()
      ),
      onFieldSubmitted: (_) => widgetController.enviarMensagem(),
    );
  }
  Widget _suffixIcon(){
    return IconButton(
        onPressed: widgetController.enviarMensagem,
        icon: Icon(Icons.send)
    );
  }
}