import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/processar_pedido_contato/method.dart';
import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/features/pedidos_pendentes/pedidos_pendentes_view_controller.dart';
import 'package:nexu_chat_client/features/pedidos_pendentes/widgets/pedido_contato_widget/pedido_contato_widget_view.dart';

final class PedidosPendentesView extends StatefulWidget{
  final PedidosPendentesViewController viewController;
  PedidosPendentesView({super.key}) : viewController = PedidosPendentesViewController();

  @override
  State<StatefulWidget> createState() {
    return _PedidosPendentesViewState();
  }
}
final class _PedidosPendentesViewState extends State<PedidosPendentesView>{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.viewController.buscarPedidos();
    });

    return ListView(
      children: [
        _campoProcura(),
        _listaPedidos(),
      ],
    );
  }
  void _handler(EventPostRequest<ContactRequestsController> event){
    if(!mounted) return;

    if(!event.isLoading && event.method is ProcessarPedidoContatoMethod){
      final dto = event.responseDto;
      if(dto is Dto){
        widget.viewController.buscarPedidos();
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TextField(
          decoration: InputDecoration(labelText: "Email do usuario"),
        ),
      ),
    );
  }
  Widget _listaPedidos(){
    return ValueListenableBuilder(
      valueListenable: widget.viewController.isLoading,
      builder: (context, isLoading, child) {
        if(isLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: widget.viewController.pedidos.map((pedido){
            return _buildPedidoWidget(pedido);
          }).toList(),
        );
      },
    );
  }
  Widget _buildPedidoWidget(PedidoContatoModel pedidoContato){
    return PedidoContatoWidgetView(pedidoContato, widget.viewController.pedidoUUIDSelecionado);
  }
}