import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/users/methods/logout/method.dart';
import 'package:nexu_chat_client/features/auth/login/login_view.dart';

final class MainMenuViewController {
  Future<void> encerrarSessao(BuildContext context) async{
    await UsersController.fetch(LogoutMethod());

    if(context.mounted){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return LoginView();
      },), (route) => false,);
    }
  }
}