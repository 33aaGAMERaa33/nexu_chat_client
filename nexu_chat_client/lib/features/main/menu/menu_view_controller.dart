import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/show_progress_indicator.dart';
import 'package:nexu_chat_client/features/auth/login/login_consumer.dart';
import 'package:nexu_chat_client/features/main/main_view_controller.dart';

import '../../../core/services/core/controllers/user_controller/methods/logout_controller.dart';
import '../../../core/services/core/controllers/user_controller/users_controller.dart';
import '../../../core/services/service_request.dart';

class MainMenuViewController {
  final MainViewController mainState;
  MainMenuViewController(this.mainState);

  void encerrarSessao(BuildContext context) async{
    showProgressIndicator(context, barrierDismissible: false);
    final resposta = await ServiceRequest.fetch<UserController>(LogoutController());

    if(context.mounted){
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginView();
      },));
    }
  }

  void alterarBody(BuildContext context, MainBody mainBody){
    mainState.mainBody.value = mainBody;
    Navigator.pop(context);
  }
}