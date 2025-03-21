import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/main/body/body_view.dart';
import 'package:nexu_chat_client/features/main/main_view_controller.dart';
import 'package:nexu_chat_client/features/main/menu/menu_view.dart';
import 'package:nexu_chat_client/main.dart';

final class MainView extends StatelessWidget{
  final MainViewController viewController;
  MainView({super.key}) : viewController = MainViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(nomeApp),
      ),
      drawer: MainMenuView(),
      body: MainBodyView(),
    );
  }
}