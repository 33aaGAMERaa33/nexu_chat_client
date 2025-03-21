import 'package:nexu_chat_client/core/controllers/dto/dto/pagination_dto.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/utils/enum_contact_status.dart';
import 'package:nexu_chat_client/utils/enum_to_string.dart';

final class ObterContatosRequestDto extends RequestDto implements UserModel, RequestPaginationDto{
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
  final ContactStatus status;
  ObterContatosRequestDto({
    this.uuid = "",
    this.username = "",
    this.email = "",
    this.limit = 50,
    this.page = 1,
    this.status = ContactStatus.active,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "status": enumToString(status),
      "search_user": {
        "uuid": uuid,
        "username": username,
        "email": email,
      },
      "pagination": {
        "limit": limit,
        "page": page
      },
    };
  }
}