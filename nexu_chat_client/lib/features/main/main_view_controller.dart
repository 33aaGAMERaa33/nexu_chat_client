import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/main/body/contatos/contatos_view.dart';
import 'package:nexu_chat_client/features/main/body/conversas/conversas.dart';

Map<MainBody, Map> _configMainBody = {
  MainBody.conversas: {
    "title": "Conversas",
    "pag": const Conversas(),
    "icon": Icons.chat
  },
  MainBody.contatos: {
    "title": "Contatos",
    "pag": ContatosView(),
    "icon": Icons.contacts
  }
};

enum MainBody{
  conversas,
  contatos;

  Widget toBody(){
    return _configMainBody[this]!["pag"];
  }
  String getTitle(){
    return _configMainBody[this]!["title"];
  }
  IconData getIcon(){
    return _configMainBody[this]!["icon"];
  }
}

class MainViewController extends ChangeNotifier{
  final ValueNotifier<MainBody> mainBody = ValueNotifier(MainBody.conversas);

  void alterarBody(MainBody body){
    mainBody.value = body;
  }
}