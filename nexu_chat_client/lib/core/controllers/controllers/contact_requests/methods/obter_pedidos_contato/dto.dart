import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';

final class PedidosPendentesDto extends Dto{
  final List<PedidoContatoModel> pedidos;

  PedidosPendentesDto({
    required super.status,
    required super.message,
    required this.pedidos,
  });

  @override
  String toString() {
    return "${super.toString()} | pedidos: $pedidos";
  }
}