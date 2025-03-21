abstract class Event {
  final bool isCancelavel;
  bool _cancelado = false;
  bool get hasCancelado => _cancelado;
  Event({this.isCancelavel = true});

  void cancelar(){
    _cancelado = true;
  }
}