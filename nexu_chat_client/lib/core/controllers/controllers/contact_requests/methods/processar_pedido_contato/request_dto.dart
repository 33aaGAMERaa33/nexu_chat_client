import 'package:nexu_chat_client/core/controllers/request_dto.dart';

enum TipoProcessoPedidoContato{
  accepted,
  rejected
}

final class ProcessarPedidoContatoRequestDto extends RequestDto{
  final String pedidoContatoUUID;
  final TipoProcessoPedidoContato tipoProcesso;
  ProcessarPedidoContatoRequestDto({
    required this.pedidoContatoUUID,
    required this.tipoProcesso
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "pedido_uuid": pedidoContatoUUID,
      "status": tipoProcesso.toString().split(".")[1]
    };
  }
}