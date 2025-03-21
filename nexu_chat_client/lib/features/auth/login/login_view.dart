import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/auth/auth_form.dart';
import 'package:nexu_chat_client/features/auth/login/login_view_controller.dart';
import 'package:nexu_chat_client/features/auth/register/register_view.dart';

final class LoginView extends StatelessWidget{
  final LoginViewController viewController;
  LoginView({super.key}) : viewController = LoginViewController();

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formKey: viewController.formKey,
      title: "Acessar conta",
      inputs: [
        AuthForm.buildTextFormField("Email", viewController.emailController),
        AuthForm.buildTextFormField("Senha", viewController.passwordController),
      ],
      actions: [
        AuthForm.buildActionButton("Criar conta", (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return RegisterView();
          },));
        }),
        AuthForm.buildActionButton("Acessar conta", (){
          viewController.acessarConta(context);
        }),
      ],
      loadingNotifier: viewController.isLoading,
      messageNotifier: viewController.message,
    );
  }
}