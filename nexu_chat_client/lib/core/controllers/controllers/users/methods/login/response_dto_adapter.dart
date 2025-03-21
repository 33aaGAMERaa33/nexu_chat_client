import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';

import 'dto.dart';

final class LoginResponseDtoAdapter extends ResponseDtoAdapter{
  @override
  dynamic adapter(Response respose) {
    if(respose.data["status"] == "success"){
      final data = respose.data;
      final user = data["user"];

      final dto = LoginResponseDTO(
        status: data["status"],
        message: data["message"],
        uuid: user["uuid"],
        username: user["username"],
        email: user["email"],
        token: user["token"]
      );

      return dto;
    }

    return respose;
  }
}