import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/obter_mensagens/dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/utils/string_to_enum.dart';

final class ObterMensagensResponseDtoAdapter extends ResponseDtoAdapter{
  @override
  adapter(Response respose) {

    if(respose.data["status"] == "success"){
      final List<MensagemModel> mensagens = [];

      for(final mensagem in respose.data["mensagens"]){
        final message = mensagem["message"];
        final type = parseEnum(MensagemType.values, mensagem["type"]);
        final sender = UserModel(
          uuid: mensagem["sender_uuid"],
          username: mensagem["sender_username"],
          email: mensagem["sender_email"]
        );
        final contactUUID = mensagem["contact_uuid"];
        final sentAt = DateTime.parse(mensagem["sent_at"]);

        mensagens.add(MensagemModel(
          message: message,
          type: type,
          sender: sender,
          sentAt: sentAt,
          contactUUID: contactUUID
        ));
      }

      return ObterMensagensDto(
        status: respose.data["status"],
        message: respose.data["message"],
        mensagens: mensagens
      );
    }

    return super.adapter(respose);
  }
}