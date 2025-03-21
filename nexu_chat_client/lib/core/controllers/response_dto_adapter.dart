import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/dto/dto.dart';

class ResponseDtoAdapter {
  static final _instance = ResponseDtoAdapter();

  ResponseDtoAdapter();
  factory ResponseDtoAdapter.static() => _instance;

  dynamic adapter(Response respose){
    if(respose.data["status"] == "success"){
      return Dto(
        status: respose.data["status"],
        message: respose.data["message"]
      );
    }else{
      return Dto(
        status: "error",
        message: respose.data["message"]
      );
    }
  }
}