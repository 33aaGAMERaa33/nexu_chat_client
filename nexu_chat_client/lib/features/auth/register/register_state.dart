import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/state_is_loading.dart';
import 'package:nexu_chat_client/core/state_message.dart';
import 'package:nexu_chat_client/features/auth/login/login_consumer.dart';

import '../../../core/services/core/controllers/user_controller/dto/register_user_dto.dart';
import '../../../core/services/core/controllers/user_controller/methods/register_controller.dart';
import '../../../core/services/core/controllers/user_controller/users_controller.dart';
import '../../../core/services/service_request.dart';

class RegisterState extends ChangeNotifier with StateIsLoading, StateMessage{
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void criarConta(BuildContext context) async{
    if(formKey.currentState!.validate()){
      isLoading.value = true;

      final registerUserDto = RegisterUserDto(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );

      var resposta = await ServiceRequest.fetch<UserController>(RegisterController(registerUserDto));

      if(resposta.data["status"] == "success"){
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                  "Conta criada com êxito"
              )));
            });

            return LoginView();
          },));


        }
      }else{
        message.value = resposta.data["message"];
      }

      isLoading.value = false;
    }
  }
}