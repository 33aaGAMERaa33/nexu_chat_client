import 'event.dart';

class EventManager {
  static final Map<Type, Set<Function>> ouvintesEventos = {};

  static void dispararEvento<T extends Event>(T evento){
    final ouvintesEvento = ouvintesEventos[T];

    ouvintesEvento?.forEach((handler){
      handler(evento);
    });
  }
  static void adicionarOuvinte<T extends Event>(void Function(T) handler) {
    removerOuvinte<T>(handler);
    ouvintesEventos[T] ??= <Function>{};
    ouvintesEventos[T]!.add(handler);
  }

  static void removerOuvinte<T extends Event>(void Function(T) handler) {
    final ouvintesEvento = ouvintesEventos[T];

    if(ouvintesEvento != null){
      ouvintesEvento.removeWhere((element) {
        return element.toString() == handler.toString();
      },);

      if(ouvintesEvento.isEmpty){
        ouvintesEventos.remove(T);
      }
    }
  }
}
