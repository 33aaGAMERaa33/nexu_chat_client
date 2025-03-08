
import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';
import '../dto/register_user_dto.dart';
import '../users_controller.dart';

class RegisterController extends Method<UserController>{
  static final _instance = RegisterController._();
  static late RegisterUserDto _registerUserDto;

  RegisterController._() : super(
    controller: UserController(),
    method: "register",
    httpMethod: HTTPMethods.post,
    needToken: false
  );

  factory RegisterController(RegisterUserDto registerUserDto){
    _registerUserDto = registerUserDto;
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _registerUserDto.data()!;
  }
}