import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/features/contatos/enviar_pedido_contato/enviar_pedido_alert/enviar_pedido_alert_view_controller.dart';

final class EnviarPedidoAlertView extends StatelessWidget{
  final EnviarPedidoAlertViewController viewController;
  EnviarPedidoAlertView(UserModel user, {super.key}) : viewController = EnviarPedidoAlertViewController(user);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enviar pedido para"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField("Nome de usuario", viewController.user.username),
          _buildTextField("Email", viewController.user.email),
        ],
      ),
      actions: [
        _buildAction("Cancelar", (){
          Navigator.pop(context);
        }),
        _buildAction("Enviar pedido", (){
          viewController.enviarPedido(context);
        }),
      ],
    );
  }

  Widget _buildTextField(String label, String value){
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: value,
      readOnly: true,
    );
  }
  Widget _buildAction(String child, Function() onPressed){
    return ElevatedButton(onPressed: onPressed, child: Text(child));
  }
}