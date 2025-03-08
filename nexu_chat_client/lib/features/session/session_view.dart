import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/session/session_view_controller.dart';
import 'package:nexu_chat_client/main.dart';

class SessionView extends StatelessWidget{
  final SessionViewController viewController = SessionViewController();
  SessionView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      viewController.verificarSessaoAtiva(context);
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.transparent,),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(nomeApp),
            ),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
