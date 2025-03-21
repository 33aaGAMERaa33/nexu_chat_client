import 'package:nexu_chat_client/core/controllers/request_dto.dart';

final class EnviarPedidoContatoRequestDTO extends RequestDto{
  final String receiverUUID;
  EnviarPedidoContatoRequestDTO(this.receiverUUID);

  @override
  Map<String, dynamic> buildData() {
    return {
      "receiver_uuid": receiverUUID
    };
  }
}