import 'package:nexu_chat_client/core/services/core/dto.dart';

enum EnumTiposParaProcessarPedido{
  accepted,
  rejected;

  String toTitle(){
    switch(this){
      case(EnumTiposParaProcessarPedido.accepted):
        return "Aceitar pedido";
      case(EnumTiposParaProcessarPedido.rejected):
        return "Rejeitar pedido";
    }
  }
}

class ProcessarPedidoContatoDto extends Dto{
  final int pedidoContatoId;
  final EnumTiposParaProcessarPedido tipo;
  ProcessarPedidoContatoDto({required this.pedidoContatoId, required this.tipo});

  @override
  data() {
    return {
      "id": pedidoContatoId,
      "status": tipo.toString().split(".")[1]
    };
  }
}