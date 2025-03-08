import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget{
  final String titulo;
  final GlobalKey<FormState> formKey;
  final Widget content;
  final Widget actions;
  final ValueNotifier<bool> loadingNotifier;
  final ValueNotifier<String?> errorMessage;
  final double ? width;
  final double ? height;

  const AuthForm({
    required this.titulo,
    required this.formKey,
    required this.content,
    required this.actions,
    required this.loadingNotifier,
    required this.errorMessage,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width ?? 400,
                height: height ?? 500,
                child: _form(),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 100),
                child: _statusRequestWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _form(){
    return Form(
      key: formKey,
      child: Stack(
        children: [
          _titulo(),
          _camposPreencher(),
          _actionButtons(),
        ],
      ),
    );
  }
  Widget _titulo(){
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Text("Acessar conta"),
      ),
    );
  }
  Widget _camposPreencher(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: content,
      ),
    );
  }
  Widget _actionButtons(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: actions,
      ),
    );
  }
  Widget _statusRequestWidget(){
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CircularProgressIndicator(),
          );
        }else if(errorMessage.value != null){
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(errorMessage.value!),
          );
        }

        return const SizedBox();
      },
    );
  }

  static Widget buildTextFormField(String label, TextEditingController controller){
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
    );
  }
  static Widget buildActionButton(String child, Function() onPressed){
    return Expanded(
      child: ElevatedButton(onPressed: onPressed, child: Text(child)),
    );
  }
}