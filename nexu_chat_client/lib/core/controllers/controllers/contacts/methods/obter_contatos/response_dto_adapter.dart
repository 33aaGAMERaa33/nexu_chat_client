import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contacts/methods/obter_contatos/dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/utils/enum_contact_status.dart';

final class ObterContatosResponseDtoAdapter extends ResponseDtoAdapter {
  @override
  adapter(Response respose) {
    if(respose.data["status"] == "success"){
      List<ContatoModel> contatos = [];
      
      for(final contato in respose.data["contatos"]){
        contatos.add(ContatoModel(
          uuid: contato["uuid"],
          username: contato["username"],
          email: contato["email"],
          status: ContactStatus.parse(contato["status"]),
          contactUUID: contato["contact_uuid"]
        ));
      }
      
      return ObterContatosDto(
        status: respose.data["status"],
        message: respose.data["message"],
        contatos: contatos
      );
    }

    return super.adapter(respose);
  }
}