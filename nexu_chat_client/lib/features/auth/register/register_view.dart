import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/auth/auth_form.dart';
import 'package:nexu_chat_client/features/auth/login/login_view.dart';
import 'package:nexu_chat_client/features/auth/register/register_view_controller.dart';

final class RegisterView extends StatelessWidget{
  late final RegisterViewController viewController;
  RegisterView({super.key}) : viewController = RegisterViewController();

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      formKey: viewController.formKey,
      title: "Acessar conta",
      inputs: [
        AuthForm.buildTextFormField("Nome de usuario", viewController.usernameController),
        AuthForm.buildTextFormField("Email", viewController.emailController),
        AuthForm.buildTextFormField("Senha", viewController.passwordController),
        AuthForm.buildTextFormField("Confirmar senha", viewController.passwordAgainController),
      ],
      actions: [
        AuthForm.buildActionButton("Acessar conta", (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return LoginView();
          },));
        }),
        AuthForm.buildActionButton("Criar conta", (){
          viewController.criarConta();
        }),
      ],
      loadingNotifier: viewController.isLoading,
      messageNotifier: viewController.message,
    );
  }
}