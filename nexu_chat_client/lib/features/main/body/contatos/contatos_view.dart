import 'package:flutter/material.dart';
import 'package:nexu_chat_client/features/enviar_pedido_contato/enviar_pedido_contato_view.dart';
import 'package:nexu_chat_client/features/main/body/contatos/contatos_view_controller.dart';
import 'package:nexu_chat_client/features/pedidos_contato/pedidos_contato_view.dart';

class ContatosView extends StatelessWidget{
  final ContatosViewController viewController = ContatosViewController();
  ContatosView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      viewController.buscarContatos();
    });

    return Scaffold(
      body: ListView(
        children: [
          _actions(context),
          _listaContatos(),
        ],
      ),
    );
  }
  Widget _actions(BuildContext context){
    return Column(
      children: [
        _enviarPedidoContato(context),
        _verPedidosPendentes(context),
      ],
    );
  }
  Widget _enviarPedidoContato(BuildContext context){
    return _buildOption(
        title: "Enviar pedido de contato",
        icon: Icons.person_add,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EnviarPedidoContatoView();
          },));
        }
    );
  }
  Widget _verPedidosPendentes(BuildContext context){
    return _buildOption(
        title: "Ver pedidos pendentes",
        icon: Icons.history,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PedidosContatoView();
          },));
        }
    );
  }
  Widget _procurarContato(){
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TextFormField(
          decoration: InputDecoration(labelText: "Nome de usuario"),
          onChanged: (value){
            viewController.buscarContatos(username: value.trim());
          },
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
          children: [
            const Text("Contatos"),
            ...viewController.contatos.map((contato){
              return _buildContatoWidget(context, contato);
            }),
          ],
        );
      },
    );
  }
  Widget _buildOption({
    required String title,
    required IconData icon,
    required Function() onTap
  }){
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  Widget _buildContatoWidget(BuildContext context, Map contato){
    return ListTile(
      title: Text(contato["username"] ?? ""),
      subtitle: Text(contato["email"] ?? ""),
      onTap: (){

      },
    );
  }
}