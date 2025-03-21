import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_mensagem_recebida.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_logged_model.dart';
import 'package:nexu_chat_client/main.dart';
import 'package:nexu_chat_client/utils/global_context.dart';
import 'package:nexu_chat_client/widgets/mensagem_recebida_pop_up/mensagem_recebida_pop_up.dart';

final class MensagemRecebidaService {
  static final _popUpDuration = const Duration(seconds: 2);

  static void _handler(EventMensagemRecebida event){
    if(UserLoggedModel().uuid != event.mensagem.sender.uuid){
      showPopUpMensagem(globalContext, event.mensagem);
    }
  }
  static void init(){
    EventManager.addListener<EventMensagemRecebida>(_handler);
  }
}

void showPopUpMensagem(BuildContext context, MensagemModel mensagem){
  scaffoldMessengerKey.currentState!.clearSnackBars();

  scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
    duration: MensagemRecebidaService._popUpDuration,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: MensagemRecebidaPopUp(mensagem),
  ));
}