import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/utils/state_is_loading.dart';
import 'package:nexu_chat_client/utils/state_message.dart';

import '../../../core/controllers/controllers/users/methods/register/dto.dart';
import '../../../core/controllers/controllers/users/methods/register/method.dart';
import '../../../core/controllers/controllers/users/methods/register/request_dto.dart';
import '../../../core/controllers/controllers/users/controller.dart';

final class RegisterViewController with StateIsLoading, StateMessage{
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  void criarConta() async{
    isLoading.value = true;

    final dto = RegisterRequestDTO(
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );

    final resposta = await UsersController.fetch(RegisterMethod(dto));

    if(resposta is RegisterResponseDTO){
      message.value = resposta.message;
    }else if(resposta is Response){
      if(resposta.data["message"] is List){
        message.value = resposta.data["message"][0];
      }else{
        message.value = resposta.data["message"];
      }
    }

    isLoading.value = false;
  }
}