import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/state_is_loading.dart';
import 'package:nexu_chat_client/core/state_message.dart';
import 'package:nexu_chat_client/features/session/session_view.dart';

import '../../../core/services/core/controllers/user_controller/dto/login_user_dto.dart';
import '../../../core/services/core/controllers/user_controller/methods/login_controller.dart';
import '../../../core/services/core/controllers/user_controller/users_controller.dart';
import '../../../core/services/service_request.dart';

class LoginViewController extends ChangeNotifier with StateIsLoading, StateMessage{
  final animationDuration = const Duration(milliseconds: 200);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController(text: "luan@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "123");

  void acessarConta(BuildContext context) async{
    if(!isLoading.value && formKey.currentState!.validate()){
      isLoading.value = true;

      final loginUserDto = LoginUserDto(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );

      final resposta = await ServiceRequest.fetch<UserController>(LoginController(loginUserDto: loginUserDto));

      if(resposta.data["status"] == "success" && context.mounted){
        message.value = null;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return SessionView();
        },));
      }else{
        message.value = resposta.data["message"];
      }

      isLoading.value = false;
    }
  }
}