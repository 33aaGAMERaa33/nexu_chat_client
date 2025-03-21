import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_main_body_changed.dart';
import 'package:nexu_chat_client/features/auth/login/login_view.dart';
import 'package:nexu_chat_client/features/main/body/body_view_controller.dart';
import 'package:nexu_chat_client/features/main/menu/menu_view_controller.dart';

final class MainMenuView extends StatelessWidget{
  late final MainMenuViewController viewController;
  MainMenuView({super.key}) : viewController = MainMenuViewController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ...MainBodyState.values.map((bodyState){
                return _buildMenuItem(
                  bodyState.title(),
                  bodyState.icon(),
                  () {
                    Navigator.pop(context);
                    EventManager.dispararEvento<EventMainBodyChanged>(EventMainBodyChanged(
                      bodyState
                    ));
                  },
                );
              })
            ],
          ),
          Column(
            children: [
              _buildMenuItem("Encerrar sessão", Icons.exit_to_app, (){
                viewController.encerrarSessao(context);
              })
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Function() onTap){
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}