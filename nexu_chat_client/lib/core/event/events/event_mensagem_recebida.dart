import 'package:nexu_chat_client/core/event/event.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';

final class EventMensagemRecebida extends Event{
  final MensagemModel mensagem;
  EventMensagemRecebida(this.mensagem) : super(isCancelavel: true);
}