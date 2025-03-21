import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';
import 'package:nexu_chat_client/features/contatos/enviar_pedido_contato/enviar_pedido_contato_view.dart';
import 'package:nexu_chat_client/features/conversa/conversa_view.dart';

import 'contatos_view_controller.dart';

final class ContatosView extends StatelessWidget{
  final ContatosViewController viewController;
  ContatosView({super.key}) : viewController = ContatosViewController();


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      viewController.buscarContatos();
    });

    return Scaffold(
      body: ListView(
        children: [
          _campoProcura(),
          _listaContatos(),
        ],
      ),
      floatingActionButton: _enviarPedidoContato(context),
    );
  }

  Widget _enviarPedidoContato(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EnviarPedidoContatoView();
        },));
      },
      child: const Icon(Icons.add),
    );
  }
  Widget _campoProcura(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TextField(
          decoration: InputDecoration(
              labelText: "Email do usuario"
          ),
        ),
      ),
    );
  }
  Widget _listaContatos(){
    return ValueListenableBuilder(
      valueListenable: viewController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: viewController.contatos.map((contato){
            return _buildContatoWidget(context, contato);
          }).toList(),
        );
      },
    );
  }
  Widget _buildContatoWidget(BuildContext context, ContatoModel contato){
    return ListTile(
      title: Text(contato.username),
      subtitle: Text(contato.email),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ConversaView(contato);
        },));
      },
    );
  }
}