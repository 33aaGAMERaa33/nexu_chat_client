import 'package:nexu_chat_client/core/models/user_model.dart';

enum PedidoContatoStatus{
  accepted,
  rejected,
  pending;

  static PedidoContatoStatus parse(String string){
    for(final status in PedidoContatoStatus.values){
      if(status.toString() == string){
        return status;
      }
    }

    throw Exception("Não foi possivel converter o string para enum");
  }
  static PedidoContatoStatus ? tryParse(String string){
    for(final status in PedidoContatoStatus.values){
      if(status.toString() == string){
        return status;
      }
    }

    return null;
  }

  @override
  String toString(){
    return super.toString().split(".")[1];
  }
}
interface class PedidoContatoModel {
  final UserModel sender;
  final String pedidoUUID;
  final PedidoContatoStatus pedidoStatus;

  PedidoContatoModel({
    required this.sender,
    required this.pedidoStatus,
    required this.pedidoUUID
  });
}