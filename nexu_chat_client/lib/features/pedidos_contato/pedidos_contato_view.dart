import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/formatador_data.dart';
import 'package:nexu_chat_client/features/pedidos_contato/pedidos_contato_view_controller.dart';
import 'package:nexu_chat_client/widgets/contact_request_decision/contact_request_decision_alert_dialog.dart';

class PedidosContatoView extends StatelessWidget{
  final PedidosContatoViewController viewController = PedidosContatoViewController();
  PedidosContatoView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      viewController.buscarPedidosContato();
    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos de contato"),
      ),
      body: ListView(
        children: [
          _listaPedidos(),
        ],
      ),
    );
  }
  Widget _listaPedidos(){
    return ValueListenableBuilder(
      valueListenable: viewController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: viewController.pedidos.map((pedido){
            return _buildRequestWidget(context, pedido);
          }).toList(),
        );
      },
    );
  }

  Widget _buildRequestWidget(BuildContext context, Map pedido){
    return ListTile(
      title: Text(pedido["sender_username"]),
      subtitle: Text(pedido["sender_email"]),
      trailing: Text("Dia enviado: ${formatarData(DateTime.parse(pedido["created_at"]))}"),
      onTap: (){
        showDialog(context: context, builder: (context) {
          return ContactRequestDecisionAlertDialog(pedido);
        },);
      },
    );
  }
}