
import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/enviar_pedido_contato/method.dart';
import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/features/contatos/enviar_pedido_contato/enviar_pedido_alert/enviar_pedido_alert_view.dart';
import 'package:nexu_chat_client/features/contatos/enviar_pedido_contato/enviar_pedido_contato_view_controller.dart';

import '../../../core/models/user_model.dart';

final class EnviarPedidoContatoView extends StatefulWidget{
  final EnviarPedidoContatoViewController viewController;
  EnviarPedidoContatoView({super.key}) : viewController = EnviarPedidoContatoViewController();

  @override
  State<StatefulWidget> createState() {
    return _EnviarPedidoContatoState();
  }
}
final class _EnviarPedidoContatoState extends State<EnviarPedidoContatoView>{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.viewController.buscarUsuariosNaoRelacionados();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enviar pedido contato"),
      ),
      body: ListView(
        children: [
          _campoProcura(),
          _listaUsers(),
        ],
      ),
    );
  }
  void _handler(EventPostRequest<ContactRequestsController> event){
    if(mounted){
      if(!event.isLoading && event.method is EnviarPedidoContatoMethod){
        final dto = event.responseDto;
        if(dto is Dto && dto.status == "success"){
          widget.viewController.buscarUsuariosNaoRelacionados();
        }
      }
    }
  }
  @override
  void initState() {
    super.initState();
    EventManager.addListener<EventPostRequest<ContactRequestsController>>(_handler);
  }
  @override
  void dispose() {
    super.dispose();
    EventManager.removeListener<EventPostRequest<ContactRequestsController>>(_handler);
  }
  Widget _campoProcura(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Email do usuario",
          ),
        ),
      ),
    );
  }
  Widget _listaUsers(){
    return ValueListenableBuilder(
      valueListenable: widget.viewController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: widget.viewController.users.map((user){
            return _buildUserWidget(context, user);
          }).toList(),
        );
      },
    );
  }
  Widget _buildUserWidget(BuildContext context, UserModel user){
    return ListTile(
      title: Text(user.username),
      subtitle: Text(user.email),
      onTap: (){
        showDialog(context: context, builder: (context) {
          return EnviarPedidoAlertView(user);
        },);
      },
    );
  }
}