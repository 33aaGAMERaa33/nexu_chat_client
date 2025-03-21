import 'package:flutter/material.dart';
import 'package:nexu_chat_client/core/controllers/controllers/contact_requests/methods/processar_pedido_contato/request_dto.dart';
import 'package:nexu_chat_client/core/models/pedido_contato_model.dart';
import 'package:nexu_chat_client/features/pedidos_pendentes/widgets/pedido_contato_widget/widget_core/widget_actions_animated_controller.dart';

final class WidgetActionsAnimated extends StatefulWidget{
  final WidgetActionsAnimatedController controller;
  WidgetActionsAnimated(PedidoContatoModel pedidoContato, ValueNotifier<String?> pedidoUUIDSelecionado, {super.key})
  : controller = WidgetActionsAnimatedController(pedidoContato, pedidoUUIDSelecionado);

  @override
  State<StatefulWidget> createState() {
   return _WidgetActionsAnimatedState();
  }
}
final class _WidgetActionsAnimatedState extends State<WidgetActionsAnimated>{
  @override
  Widget build(BuildContext context) {
    late final Widget ? child;

    if(widget.controller.isLoading.value){
      child = SizedBox(
        width: 100,
        height: 50,
        child: Center(child: CircularProgressIndicator(),),
      );
    }else if(widget.controller.isProcessed){
      child = const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Icon(Icons.check),
      );
    }else if(widget.controller.stateTrue){
      child = _actions();
    }else{
      child = null;
    }

    Widget sizedBox = SizedBox(
      height: double.infinity,
      child: child,
    );

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: AnimatedSize(
        duration: widget.controller.animationDuration,
        child: sizedBox,
      ),
    );
  }
  void _handler(){
    bool processandoOuProcessado = widget.controller.isLoading.value || widget.controller.isProcessed;
    bool selecionadoTrue = widget.controller.selected || widget.controller.thisSelected;

    if(mounted && selecionadoTrue && !processandoOuProcessado){
      if(widget.controller.thisSelected){
        widget.controller.selected = true;
      }else{
        widget.controller.selected = false;
      }

      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    widget.controller.pedidoUUIDSelecionado.addListener(_handler);
  }
  @override
  void dispose() {
    super.dispose();
    widget.controller.pedidoUUIDSelecionado.removeListener(_handler);
  }

  Widget _actions(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAction(Icons.check, Colors.green, TipoProcessoPedidoContato.accepted),
        const SizedBox(width: 5,),
        _buildAction(Icons.block, Colors.red, TipoProcessoPedidoContato.rejected),
      ],
    );
  }
  Widget _buildAction(IconData icon, Color color, TipoProcessoPedidoContato tipoProcesso){
    return IconButton(
        onPressed: !widget.controller.stateTrue ? null : () async{
          final process = widget.controller.processarPedido(tipoProcesso);
          setState((){});
          await process;
          setState(() {});
        },
        icon: Icon(icon, color: color,)
    );
  }
}