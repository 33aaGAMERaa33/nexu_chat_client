import 'package:nexu_chat_client/core/controllers/dto/dto/pagination_dto.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';

import '../../../core/controllers/controllers/users/methods/obter_users_nao_relacionados/dto.dart';
import '../../../core/controllers/controllers/users/methods/obter_users_nao_relacionados/method.dart';
import '../../../core/controllers/controllers/users/methods/obter_users_nao_relacionados/request_dto.dart';
import '../../../core/controllers/controllers/users/controller.dart';

final class EnviarPedidoContatoViewController with StateIsLoading{
  List users = [];

  Future<void> buscarUsuariosNaoRelacionados() async{
    isLoading.value = true;

    final dto = ObterUsersNaoRelacionadosRequestDTO();
    final resposta = await UsersController.fetch(ObterUsersNaoRelacionadosMethod(dto));

    if(resposta is ObterUsersNaoRelacionadosDTO){
      users = resposta.users;
    }

    isLoading.value = false;
  }
}