import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/contatos/contatos_view.dart';
import 'package:nexu_chat_client/features/conversas/conversas_view.dart';
import 'package:nexu_chat_client/features/pedidos_pendentes/pedidos_pendentes_view.dart';

enum MainBodyState{
  conversas,
  contatos,
  pedidosPendentes;

  @override
  toString(){
    return super.toString().split(".")[1];
  }
  String title(){
    List<String> thisString = toString().characters.toList();
    String title = "";

    int index = 0;

    for(final char in thisString){
      if(index == 0){
        title += char.toUpperCase();
      }else if(char == char.toUpperCase()){
        title += " ${char}";
      }else{
        title += char;
      }

      index++;
    }

    return title;
  }
  IconData icon(){
    switch(this){
      case MainBodyState.conversas:
        return Icons.chat;
      case MainBodyState.contatos:
        return Icons.person;
      case MainBodyState.pedidosPendentes:
        return Icons.history;
    }
  }
  Widget widget(){
    switch(this){
      case MainBodyState.conversas:
        return ConversasView();
      case MainBodyState.contatos:
        return ContatosView();
      case MainBodyState.pedidosPendentes:
        return PedidosPendentesView();
      default:
        return const Center(
          child: Text("Not implemented"),
        );
    }
  }
}

MainBodyState _bodyState = MainBodyState.conversas;

final class MainBodyViewController {
  MainBodyState get bodyState => _bodyState;
  set bodyState(bodyState) => _bodyState = bodyState;
}