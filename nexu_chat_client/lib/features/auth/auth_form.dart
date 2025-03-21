import 'package:flutter/material.dart';

final class AuthForm extends StatelessWidget{
  final String title;
  final List<Widget> inputs;
  final List<Widget> actions;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> loadingNotifier;
  final ValueNotifier<String?> messageNotifier;

  const AuthForm({
    required this.title,
    required this.inputs,
    required this.actions,
    required this.formKey,
    required this.loadingNotifier,
    required this.messageNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 400,
                  height: 500,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTitleWidget(),
                        _buildInputsWidget(),
                        _buildActionsWidget(),
                      ],
                    ),
                  ),
                ),
                _statusForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(){
    return Text(title);
  }
  Widget _buildInputsWidget(){
    return Column(
      children: inputs,
    );
  }
  Widget _buildActionsWidget(){
    return Row(
      children: actions,
    );
  }
  Widget _statusForm(){
    return ValueListenableBuilder(
      valueListenable: loadingNotifier,
      builder: (context, isLoading, child) {
        if(isLoading){
          return CircularProgressIndicator();
        }else if(messageNotifier.value != null){
          return Text(messageNotifier.value!);
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
      child: ElevatedButton(onPressed: onPressed, child: Text(child))
    );
  }
}