import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_web_socket_connected.dart';

final class ConnectedService {
  static final _instance = ConnectedService._();
  ConnectedService._();

  static void _handler(EventWebSocketConnected event){
    print("Conectado");
  }
  static void init(){
    EventManager.adicionarOuvinte<EventWebSocketConnected>(_handler);
  }
  static void dispose(){
    EventManager.removerOuvinte<EventWebSocketConnected>(_handler);
  }
}