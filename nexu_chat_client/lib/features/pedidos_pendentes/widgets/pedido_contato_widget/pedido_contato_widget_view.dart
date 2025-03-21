import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/features/pedidos_pendentes/widgets/pedido_contato_widget/widget_core/widget_actions_animated.dart';

final class PedidoContatoWidgetView extends StatelessWidget{
  final PedidoContatoModel pedidoContato;
  final ValueNotifier<String?> pedidoUUIDSelecionado;
  const PedidoContatoWidgetView(this.pedidoContato, this.pedidoUUIDSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pedidoContato.sender.username),
      subtitle: Text(pedidoContato.sender.email),
      trailing: WidgetActionsAnimated(pedidoContato, pedidoUUIDSelecionado),
      onTap: (){
        pedidoUUIDSelecionado.value = pedidoContato.pedidoUUID;
      },
    );
  }
}