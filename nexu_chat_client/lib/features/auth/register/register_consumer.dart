import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/auth/auth_form.dart';
import 'package:nexu_chat_client/features/auth/login/login_consumer.dart';
import 'package:nexu_chat_client/features/auth/register/register_state.dart';

class RegisterConsumer extends StatelessWidget{
  final RegisterState state;
  const RegisterConsumer(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return AuthForm(
      titulo: "Criar conta",
      formKey: state.formKey,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AuthForm.buildTextFormField("Nome de usuario", state.usernameController),
          AuthForm.buildTextFormField("Email", state.emailController),
          AuthForm.buildTextFormField("Senha", state.passwordController),
          AuthForm.buildTextFormField("Confirmar senha", state.confirmPasswordController),
        ],
      ),
      actions: Row(
        children: [
          AuthForm.buildActionButton("Acessar conta", (){
            if(!state.isLoading.value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return LoginView();
              },));
            }
          }),
          AuthForm.buildActionButton("Criar conta", (){
            state.criarConta(context);
          }),
        ],
      ),
      loadingNotifier: state.isLoading,
      errorMessage: state.message
    );
  }
}