

import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';
import '../dto/login_user_dto.dart';
import '../users_controller.dart';

class LoginController extends Method<UserController>{
  static final _instance = LoginController._();
  static late LoginUserDto _loginUserDto;

  LoginController._() : super(
    controller: UserController(),
    method: "login",
    httpMethod: HTTPMethods.post,
    needToken: false
  );

  factory LoginController({LoginUserDto ? loginUserDto}){
    if(loginUserDto != null){
      _loginUserDto = loginUserDto;
    }
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _loginUserDto.data()!;
  }
}