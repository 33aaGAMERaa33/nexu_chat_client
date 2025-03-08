import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/main/main_view_controller.dart';
import 'package:nexu_chat_client/features/main/menu/menu_view_controller.dart';

class MainMenuView extends StatelessWidget{
  late final MainMenuViewController state;
  MainMenuView(MainViewController mainState, {super.key}){
    state = MainMenuViewController(mainState);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text("Menu"),
              ...MainBody.values.map((body){
                return ListTile(
                  title: Text(body.getTitle()),
                  leading: Icon(body.getIcon()),
                  onTap: (){
                    state.alterarBody(context, body);
                  },
                );
              })
            ],
          ),
          Column(
            children: [
              _buildItemMenu(title: "Encerrar sessão", icon: Icons.exit_to_app, onTap: (){
                state.encerrarSessao(context);
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemMenu({
    required String title,
    required IconData icon,
    required Function() onTap,
  }){
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}