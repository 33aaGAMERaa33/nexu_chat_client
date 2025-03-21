import 'package:nexu_chat_client/core/controllers/controllers/contacts/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/dto.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/method.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/request_dto.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';

final class ContatosViewController with StateIsLoading{
  List<ContatoModel> contatos = [];

  Future<void> buscarContatos() async{
    isLoading.value = true;

    final dto = ObterContatosRequestDto();
    final resposta = await ContactsController.fetch(ObterContatosMethod(dto));

    if(resposta is ObterContatosDto){
      contatos = resposta.contatos;
    }

    isLoading.value = false;
  }
}