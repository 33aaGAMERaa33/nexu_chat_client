import 'package:flutter/material.dart';
import 'package:nexu_chat_client/widgets/issue_contact_request/issue_contact_request_alert_dialog_controller.dart';

class IssueContactRequestAlertDialog extends StatelessWidget{
  late final IssueContactRequestAlertDialogController alertController;

  IssueContactRequestAlertDialog(Map usuario, {super.key}){
    alertController = IssueContactRequestAlertDialogController(usuario);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enviar pedido de contato"),
      content: Column(
        children: [
          _buildTextFieldReadController("Nome de usuario", alertController.usuario["username"]),
          _buildTextFieldReadController("Email", alertController.usuario["email"]),
        ],
      ),
    );
  }

  Widget _buildTextFieldReadController(String label, String value){
    final TextEditingController controller = TextEditingController(text: value);
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      readOnly: true,
    );
  }
}