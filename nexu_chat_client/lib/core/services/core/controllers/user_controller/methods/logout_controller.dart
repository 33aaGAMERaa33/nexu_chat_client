import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';
import '../users_controller.dart';

class LogoutController extends Method<UserController>{
  static final _instance = LogoutController._();

  LogoutController._() : super(
    controller: UserController(),
    method: "logout",
    httpMethod: HTTPMethods.post,
    needToken: true
  );

  factory LogoutController(){
    return _instance;
  }
}