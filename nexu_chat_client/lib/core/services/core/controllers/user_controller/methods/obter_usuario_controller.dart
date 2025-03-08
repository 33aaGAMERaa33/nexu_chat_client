import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';
import '../users_controller.dart';

class ObterUsuarioController extends Method<UserController>{
  static final _instance = ObterUsuarioController._();

  ObterUsuarioController._() : super(
    controller: UserController(),
    method: "obter-usuario",
    httpMethod: HTTPMethods.post,
    needToken: true
  );

  factory ObterUsuarioController(){
    return _instance;
  }

}