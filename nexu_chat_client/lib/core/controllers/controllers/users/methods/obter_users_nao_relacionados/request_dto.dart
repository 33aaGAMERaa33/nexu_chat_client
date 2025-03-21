import 'package:nexu_chat_client/core/controllers/dto/dto/pagination_dto.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

final class ObterUsersNaoRelacionadosRequestDTO extends RequestDto implements UserModel, RequestPaginationDto{
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

  ObterUsersNaoRelacionadosRequestDTO({
    this.uuid = "",
    this.username = "",
    this.email = "",
    this.limit = 50,
    this.page = 1,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "search": {
        "uuid": uuid,
        "username": username,
        "email": email
      },
      "pagination": {
        "limit": limit,
        "page": page
      }
    };
  }
}