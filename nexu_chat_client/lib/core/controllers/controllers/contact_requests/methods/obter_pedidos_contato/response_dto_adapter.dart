import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/obter_pedidos_contato/dto.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

final class PedidosPendentesResponseDtoAdapter extends ResponseDtoAdapter{
  @override
  adapter(Response respose) {
    if(respose.data["status"] == "success"){
      List<PedidoContatoModel> pedidos = [];
      
      for(final pedido in respose.data["pedidos"]){
        final sender = UserModel(
          uuid: pedido["uuid"],
          username: pedido["username"],
          email: pedido["email"]
        );
        pedidos.add(PedidoContatoModel(
          sender: sender,
          pedidoStatus: PedidoContatoStatus.parse(pedido["status"]),
          pedidoUUID: pedido["request_uuid"]
        ));
      }
      
      return PedidosPendentesDto(
        status: respose.data["status"],
        message: respose.data["message"],
        pedidos: pedidos
      );
    }
    
    return respose;
  }

}