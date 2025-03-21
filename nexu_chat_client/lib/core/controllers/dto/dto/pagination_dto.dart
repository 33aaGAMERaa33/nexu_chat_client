import 'package:nexu_chat_client/core/controllers/request_dto.dart';

interface class RequestPaginationDto extends RequestDto{
  final int limit;
  final int page;
  RequestPaginationDto({
    required this.limit,
    required this.page
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "pagination": {
        "limit": limit,
        "page": page
      }
    };
  }
}