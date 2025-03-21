import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/method.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_mensagem_recebida.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/features/conversa/lista_mensagens/mensagem_enviada_widget.dart';
import 'package:nexu_chat_client/features/conversa/lista_mensagens/lista_mensagens_widget_controller.dart';

import 'mensagem_widget.dart';

final class ListaMensagensWidget extends StatefulWidget{
  final ListaMensagensWidgetController widgetController;
  ListaMensagensWidget(ContatoModel contato, {super.key}) : widgetController = ListaMensagensWidgetController(contato);

  @override
  State<StatefulWidget> createState() {
    return _ListaMensagensWidgetState();
  }
}
final class _ListaMensagensWidgetState extends State<ListaMensagensWidget>{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(widget.widgetController.lastPageLoaded == -1){
        widget.widgetController.buscarMensagens(1);
      }
    });

    return ValueListenableBuilder(
      valueListenable: widget.widgetController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_){
          widget.widgetController.jumpToBottom();
        });

        final mensagens = widget.widgetController.mensagensWidgets;

        return ListView.builder(
          controller: widget.widgetController.scrollController,
          itemCount: mensagens.length,
          itemBuilder: (context, index) {
            return mensagens[index];
          },
        );
      },
    );
  }
  void _addMsgEnviada(EventPostRequest<MessagesController> event) async{
    if(event.method is EnviarMensagemMethod && mounted && event.isLoading){
      widget.widgetController.mensagensWidgets.add(MensagemEnviadaWidget(event));
      setState(() {});
    }
  }
  void _addMsgRecebida(EventMensagemRecebida event){
    if(mounted && event.mensagem.sender.uuid == widget.widgetController.contato.uuid){
      widget.widgetController.mensagensWidgets.add(MensagemWidget(event.mensagem));
      setState(() {});
      event.cancelar();
    }
  }

  @override
  void initState() {
    super.initState();
    EventManager.addListener<EventPostRequest<MessagesController>>(_addMsgEnviada);
    EventManager.addListener<EventMensagemRecebida>(_addMsgRecebida, handlerLevel: EventHandlerLevel.high);
  }
  @override
  void dispose() {
    super.dispose();
    EventManager.removeListener<EventPostRequest<MessagesController>>(_addMsgEnviada);
    EventManager.removeListener<EventMensagemRecebida>(_addMsgRecebida, handlerLevel: EventHandlerLevel.high);
  }
}