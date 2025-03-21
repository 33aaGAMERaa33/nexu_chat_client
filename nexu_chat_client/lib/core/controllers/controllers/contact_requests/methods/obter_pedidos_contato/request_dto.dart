import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/processar_pedido_contato/request_dto.dart';
import 'package:nexu_chat_client/core/controllers/dto/dto/pagination_dto.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

final class ObterPedidosContatoRequestDto extends RequestDto implements UserModel, RequestPaginationDto{
  @override
  final String uuid;
  @override
  final String username;
  @override
  final String email;
  @override
  final int limit;
  @override
  final int page;
  final PedidoContatoStatus status;

  ObterPedidosContatoRequestDto({
    this.uuid = "",
    this.username = "",
    this.email = "",
    this.limit = 50,
    this.page = 50,
    this.status = PedidoContatoStatus.pending,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "search_sender": {
        "uuid": uuid,
        "username": username,
        "email": email,

      },
      "request_status": status.toString(),
      "pagination": {
        "limit": limit,
        "page": page
      }
    };
  }
}