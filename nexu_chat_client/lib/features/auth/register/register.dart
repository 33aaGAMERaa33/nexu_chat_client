import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/features/auth/register/register_consumer.dart';
import 'package:nexu_chat_client/features/auth/register/register_state.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget{
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterState(),
      child: Consumer<RegisterState>(
        builder: (context, state, child) {
          return RegisterConsumer(state);
        },
      ),
    );
  }
}