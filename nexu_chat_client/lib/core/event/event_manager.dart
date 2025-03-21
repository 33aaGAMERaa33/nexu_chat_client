import 'dart:async';

import 'package:nexu_chat_client/core/controllers/controllers/messages/controller.dart';
import 'package:nexu_chat_client/core/controllers/controllers/messages/methods/enviar_mensagem/method.dart';
import 'package:nexu_chat_client/core/event/events/event_mensagem_recebida.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';

import 'event.dart';

enum EventHandlerLevel{
  high,
  low
}

class EventManager {
  EventManager._();
  static final Map<Type, Map<EventHandlerLevel, Set<Function>>> ouvintesEventos = {};

  static void dispararEvento<T extends Event>(T evento){
    final ouvintesEvento = ouvintesEventos[T];

    if(ouvintesEvento != null){
      final highLevelHandlers = List<Function>.from(ouvintesEvento[EventHandlerLevel.high] ?? []);
      final lowLevelHandlers = List<Function>.from(ouvintesEvento[EventHandlerLevel.low] ?? []);


      for (var handler in highLevelHandlers) {
        handler(evento);
      }

      if(!evento.hasCancelado){
        for (var handler in lowLevelHandlers){
          handler(evento);
        }
      }
    }
  }
  static Future<T> esperarEvento<T extends Event>({EventHandlerLevel handlerLevel = EventHandlerLevel.low}) async{
    final completer = Completer<T>();

    void handler(T event){
      completer.complete(event);
      removeListener<T>(handler);
    }

    addListener<T>(handler);

    return completer.future;
  }
  static void addListener<T extends Event>(void Function(T) handler, {EventHandlerLevel handlerLevel = EventHandlerLevel.low}) {
    ouvintesEventos[T] ??= {};
    ouvintesEventos[T]![EventHandlerLevel.high] ??= {};
    ouvintesEventos[T]![EventHandlerLevel.low] ??= {};
    ouvintesEventos[T]![handlerLevel]!.add(handler);
  }

  static void removeListener<T extends Event>(void Function(T) handler, {EventHandlerLevel handlerLevel = EventHandlerLevel.low}) {
    final ouvintesEvento = ouvintesEventos[T]?[handlerLevel];

    if(ouvintesEvento != null){
      ouvintesEvento.remove(handler);

      if(ouvintesEvento.isEmpty){
        ouvintesEventos[T]!.remove(handlerLevel);

        if(ouvintesEventos[T]!.isEmpty){
          ouvintesEventos.remove(T);
        }
      }
    }
  }
}
