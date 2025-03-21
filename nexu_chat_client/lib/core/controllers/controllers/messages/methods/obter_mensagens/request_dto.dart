import 'package:nexu_chat_client/core/controllers/dto/dto/pagination_dto.dart';
import 'package:nexu_chat_client/core/controllers/request_dto.dart';

final class ObterMensagensRequestDto extends RequestDto implements RequestPaginationDto{
  @override
  final int limit;
  @override
  final int page;
  final String contactUUID;

  ObterMensagensRequestDto({
    this.limit = 50,
    this.page = 1,
    required this.contactUUID,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "contact_uuid": contactUUID,
      "pagination": {
        "limit": limit,
        "page": page
      }
    };
  }
}