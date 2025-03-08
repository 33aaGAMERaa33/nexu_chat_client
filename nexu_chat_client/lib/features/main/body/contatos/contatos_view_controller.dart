import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/contacts_controller.dart';
import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/dto/obter_contatos_por_dados_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/contacts_controller/methods/obter_contatos_por_dados_controller.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';
import 'package:nexu_chat_client/core/state_is_loading.dart';

class ContatosViewController with StateIsLoading{
  int pag = 0;
  List contatos = [];
  final ValueNotifier<StatusContatos> statusContatos = ValueNotifier(StatusContatos.active);


  void buscarContatos({String ? username}) async{
    isLoading.value = true;

    final resposta = await ServiceRequest.fetch<ContactsController>(ObterContatosPorDadosController(
      ObterContatosPorDadosDto(
        statusContatos: StatusContatos.active
      )
    ));

    contatos = resposta.data["contatos"] ?? [];

    isLoading.value = false;
  }
}