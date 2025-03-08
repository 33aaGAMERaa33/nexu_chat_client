import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/dto/processar_pedido_contato_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/utils/status_requests_contact.dart';
import 'package:nexu_chat_client/widgets/contact_request_decision/contact_request_decision_alert_dialog_controller.dart';

class ContactRequestDecisionAlertDialog extends StatelessWidget{
  late final ContactRequestDecisionAlertDialogController alertController;
  final List _controllers = [];

  ContactRequestDecisionAlertDialog(Map requestDados, {super.key}){
    alertController = ContactRequestDecisionAlertDialogController(requestDados);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Titulo"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextFieldReadOnly("Nome de usuario", alertController.requestDados["sender_username"]),
            _buildTextFieldReadOnly("Email", alertController.requestDados["sender_email"]),
            _campoDecisao(),
          ],
        ),
      ),
      actions: [
        _buildActionButton("Cancelar", (){
          Navigator.pop(context);
        }),
        _buildActionButton("Confirmar", (){
          alertController.enviarDecisao(context);
        }),
      ],
    );
  }
  Widget _campoDecisao(){
    return ValueListenableBuilder(
      valueListenable: alertController.decisao,
      builder: (context, decisao, child) {
        return SizedBox(
          width: double.infinity,
          child: DropdownButton(
            value: decisao,
            items: EnumTiposParaProcessarPedido.values.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text(value.toTitle()),
              );
            }).toList(),
            onChanged: (value) {
              alertController.decisao.value = value ?? decisao;
            },
          )
        );
      },
    );
  }
  Widget _buildTextFieldReadOnly(String label, String value){
    final controller = TextEditingController(text: value);
    _controllers.add(controller);

    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      readOnly: true,
    );
  }
  Widget _buildActionButton(String child, Function() onPressed){
    return ElevatedButton(onPressed: onPressed, child: Text(child));
  }
}