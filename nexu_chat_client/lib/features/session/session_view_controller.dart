import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/auth/login/login_consumer.dart';
import 'package:nexu_chat_client/features/main/main_view.dart';

import '../../core/services/core/controllers/user_controller/methods/obter_usuario_controller.dart';
import '../../core/services/core/controllers/user_controller/users_controller.dart';
import '../../core/services/service_request.dart';

class SessionViewController extends ChangeNotifier{
  Future<void> verificarSessaoAtiva(BuildContext context) async{
    final resposta = await ServiceRequest.fetch<UserController>(ObterUsuarioController());

    WidgetsBinding.instance.addPostFrameCallback((_){
      if(resposta.data["status"] == "success"){
        _redirecionar(context, MainView());
      }else{
        _redirecionar(context, LoginView());
      }
    });
  }

  void _redirecionar(BuildContext context, Widget pagina){
    Navigator.push(context, MaterialPageRoute(builder: (context) => pagina,));
  }
}