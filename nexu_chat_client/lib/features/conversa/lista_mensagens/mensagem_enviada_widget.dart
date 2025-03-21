import 'package:flutter/widgets.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/request_dto.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_logged_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

import 'mensagem_widget.dart';

final class MensagemEnviadaWidget extends StatefulWidget{
  final EventPostRequest<MessagesController> mensagemEnviadaEvent;
  const MensagemEnviadaWidget(this.mensagemEnviadaEvent, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _MensagemEnviadaWidgetState();
  }
}
final class _MensagemEnviadaWidgetState extends State<MensagemEnviadaWidget>{
  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.mensagemEnviadaEvent.isLoading;
    EnviarMensagemRequestDto dto = (widget.mensagemEnviadaEvent.method.dto as EnviarMensagemRequestDto);

    final mensagem = MensagemModel(
      message: dto.message ?? "",
      type: dto.type,
      sender: (UserLoggedModel() as UserModel),
      contactUUID: "",
    );

    if(isLoading){
      _atualizarStatusMensagem();
    }

    return MensagemWidget(mensagem, isLoading: isLoading,);
  }

  void _atualizarStatusMensagem() async{
    final event = widget.mensagemEnviadaEvent;

    while(true){
      if(mounted){
        final secondEvent = await EventManager.esperarEvento<EventPostRequest<MessagesController>>();

        if(event == secondEvent){
          setState(() {});
          return;
        }
      }
    }
  }
}