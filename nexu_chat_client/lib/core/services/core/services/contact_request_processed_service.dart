import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_contact_request_processed.dart';

final class ContactRequestProcessedService {
  static final _instance = ContactRequestProcessedService._();
  ContactRequestProcessedService._();

  static void _handler(EventContactRequestProcessed event){
    print("Pedido de contato processado");
    print(event.username);
    print(event.email);
    print(event.status);
  }
  static void init(){
    EventManager.adicionarOuvinte<EventContactRequestProcessed>(_handler);
  }
  static void dispose(){
    EventManager.removerOuvinte<EventContactRequestProcessed>(_handler);
  }
}