import 'package:nexu_chat_client/core/services/core/controllers/user_controller/dto/obter_usuarios_dto.dart';

import '../../../../../http_request_api/http_request_api.dart';
import '../../../method.dart';
import '../users_controller.dart';

class ObterUsuariosController extends Method<UserController>{
  static final _instance = ObterUsuariosController._();
  static late ObterUsuariosDto _obterUsuariosDto;

  ObterUsuariosController._() : super(
      controller: UserController(),
      method: "obter-usuarios",
      httpMethod: HTTPMethods.post,
      needToken: true
  );

  factory ObterUsuariosController(ObterUsuariosDto obterUsuariosDto){
    _obterUsuariosDto = obterUsuariosDto;
    return _instance;
  }

  @override
  Map<String, dynamic> buildData() {
    return _obterUsuariosDto.data()!;
  }
}