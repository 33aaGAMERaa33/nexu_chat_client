import 'package:dio/dio.dart';

import '../../../../response_dto_adapter.dart';
import 'dto.dart';

final class RegisterResponseDtoAdapter extends ResponseDtoAdapter{
  @override
  adapter(Response respose) {
    if(respose.data["status"] == "success"){
      return RegisterResponseDTO(
        status: respose.data["status"],
        message: respose.data["message"]
      );
    }
    return respose;
  }
}