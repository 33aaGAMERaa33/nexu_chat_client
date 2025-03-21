import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/main/main_view.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';
import 'package:nexu_chat_client/utils/state_message.dart';

import '../../../core/controllers/controllers/users/methods/login/dto.dart';
import '../../../core/controllers/controllers/users/methods/login/method.dart';
import '../../../core/controllers/controllers/users/methods/login/request_dto.dart';
import '../../../core/controllers/controllers/users/controller.dart';

final class LoginViewController with StateIsLoading, StateMessage{
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "luan@gmail.com");
  final passwordController = TextEditingController(text: "123456");

  void acessarConta(BuildContext context) async{
    isLoading.value = true;
    
    final dto = LoginRequestDTO(
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );
    final resposta = await UsersController.fetch(LoginMethod(dto));

    if(context.mounted){
      if(resposta is LoginResponseDTO){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return MainView();
        },), (route) => false,);
      }
    }

    isLoading.value = false;
  }
}