import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/auth/auth_form.dart';
import 'package:nexu_chat_client/features/auth/register/register.dart';

import 'login_state.dart';

class LoginView extends StatelessWidget{
  final LoginViewController viewController = LoginViewController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
        width: 400,
        height: 500,
        titulo: "Acessar conta",
        formKey: viewController.formKey,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AuthForm.buildTextFormField("Email", viewController.emailController),
            AuthForm.buildTextFormField("Senha", viewController.passwordController),
          ],
        ),
        actions: Row(
          children: [
            AuthForm.buildActionButton("Criar conta", (){
              if(!viewController.isLoading.value){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Register();
                  },)
                );
              }
            }),
            AuthForm.buildActionButton("Acessar conta", (){
              viewController.acessarConta(context);
            }),
          ],
        ),
        loadingNotifier: viewController.isLoading,
        errorMessage: viewController.message
    );
  }
}