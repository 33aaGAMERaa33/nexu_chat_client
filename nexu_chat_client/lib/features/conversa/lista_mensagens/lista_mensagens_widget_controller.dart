import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/obter_mensagens/dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/obter_mensagens/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/obter_mensagens/request_dto.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';

import 'mensagem_widget.dart';

final class ListaMensagensWidgetController with StateIsLoading{
  final ContatoModel contato;
  int _lastPageLoaded = -1;
  List<MensagemModel> _mensagens = [];
  List<Widget> mensagensWidgets = [];
  final ScrollController scrollController = ScrollController();
  ListaMensagensWidgetController(this.contato);

  int get lastPageLoaded => _lastPageLoaded;


  Future<void> buscarMensagens(int page) async{
    isLoading.value = true;

    _lastPageLoaded = page;
    final dto = ObterMensagensRequestDto(
      contactUUID: contato.contactUUID,
      limit: 50,
      page: page,
    );
    final resposta = await MessagesController.fetch(ObterMensagensMethod(dto));

    if(resposta is ObterMensagensDto){
      if(resposta.status == "success"){
        _mensagens = resposta.mensagens.reversed.toList();
      }
    }

    _carregarMensagensListaWidget(_mensagens);
    isLoading.value = false;
  }
  void _carregarMensagensListaWidget(List<MensagemModel> mensagens){
    for(final mensagem in mensagens){
      mensagensWidgets.add(MensagemWidget(mensagem));
    }
  }
  void jumpToBottom(){
    scrollController.position.jumpTo(scrollController.position.maxScrollExtent);
  }
}

