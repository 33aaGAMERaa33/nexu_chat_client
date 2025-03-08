import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/main/menu/menu_view.dart';
import 'package:nexu_chat_client/main.dart';

import 'main_view_controller.dart';

class MainView extends StatelessWidget{
  final MainViewController viewController = MainViewController();
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(nomeApp),
      ),
      drawer: MainMenuView(viewController),
      body: ValueListenableBuilder(
        valueListenable: viewController.mainBody,
        builder: (context, mainBody, child) {
          return mainBody.toBody();
        },
      ),
    );
  }
}