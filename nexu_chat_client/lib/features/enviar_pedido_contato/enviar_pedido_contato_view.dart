import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/enviar_pedido_contato/enviar_pedido_contato_view_controller.dart';
import 'package:nexu_chat_client/widgets/issue_contact_request/issue_contact_request_alert_dialog.dart';

class EnviarPedidoContatoView extends StatelessWidget{
  late final EnviarPedidoContatoViewController viewController;
  EnviarPedidoContatoView({super.key}){
    viewController = EnviarPedidoContatoViewController();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      viewController.buscarUsuarios();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enviar pedido de contato"),
      ),
      body: ListView(
        children: [
          _campoNome(),
          _listaUsuarios(),
        ],
      ),
    );
  }

  Widget _campoNome(){
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TextField(
          decoration: InputDecoration(
              labelText: "Nome de usuario"
          ),
          controller: viewController.emailController,
          onChanged: (value){
            viewController.buscarUsuarios();
          },
        ),
      ),
    );
  }
  Widget _listaUsuarios(){
    return ValueListenableBuilder(
      valueListenable: viewController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: viewController.usuarios.map((usuario){
            return _buildUsuarioWidget(context, usuario);
          }).toList(),
        );
      },
    );
  }

  Widget _buildUsuarioWidget(BuildContext context, Map usuario){
    return ListTile(
      title: Text(usuario["username"] ?? ""),
      subtitle: Text(usuario["email"] ?? ""),
      onTap: (){
        showDialog(context: context, builder: (context) {
          return IssueContactRequestAlertDialog(usuario);
        },);
      },
    );
  }
}
