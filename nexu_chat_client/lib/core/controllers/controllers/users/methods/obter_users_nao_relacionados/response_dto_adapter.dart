import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/controllers/response_dto_adapter.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

import 'dto.dart';

final class ObterUsersNaoRelacionadosResponseDtoAdapter extends ResponseDtoAdapter{
  @override
  dynamic adapter(Response respose) {
    if(respose.data["status"] == "success"){
      final data = respose.data;
      List<UserModel> users = [];

      for(final user in data["users"]){
        users.add(UserModel(
          uuid: user["uuid"],
          username: user["username"],
          email: user["email"]
        ));
      }

      return ObterUsersNaoRelacionadosDTO(
        status: data["status"],
        message: data["message"],
        users: users
      );
    }

    return respose;
  }
}