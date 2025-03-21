import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';

final class EnviarMensagemRequestDto extends RequestDto{
  final String receiverUUID;
  final String ? message;
  final MensagemType type;
  EnviarMensagemRequestDto({
    required this.receiverUUID,
    required this.message,
    required this.type
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "receiver_uuid": receiverUUID,
      "message": message
    };
  }
}