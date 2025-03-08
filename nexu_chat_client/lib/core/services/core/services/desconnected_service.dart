import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_web_scoket_disconnected.dart';

final class DesconnectedService {
  static final _instance = DesconnectedService._();
  DesconnectedService._();

  static void _handler(EventWebSocketDisconnected event) async{
    print("Desconectado");
  }
  static void init(){
    EventManager.adicionarOuvinte<EventWebSocketDisconnected>(_handler);
  }
  static void dispose(){
    EventManager.removerOuvinte<EventWebSocketDisconnected>(_handler);
  }
}