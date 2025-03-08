import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/services/core/controllers/user_controller/dto/obter_usuarios_dto.dart';
import 'package:nexu_chat_client/core/services/core/controllers/user_controller/methods/obter_usuarios_controller.dart';
import 'package:nexu_chat_client/core/services/core/controllers/user_controller/users_controller.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';
import 'package:nexu_chat_client/core/state_is_loading.dart';

class EnviarPedidoContatoViewController with StateIsLoading{
  bool _timerIsActive = false;
  final _waitingTime = 200;
  double _pastWaitingTime = 0;
  final _delay = Duration(milliseconds: 100);
  final TextEditingController emailController = TextEditingController();

  List usuarios = [];

  void _initTimer(){
    _pastWaitingTime = 0;

    if(!_timerIsActive){
      _instanceTimer = _timer();
    }
  }

  Future<void> _timer() async{
    _timerIsActive = true;

    while(_pastWaitingTime < _waitingTime){
      await Future.delayed(_delay);
      _pastWaitingTime += _delay.inMilliseconds;
    }

    _timerIsActive = false;
  }

  late Future<void> _instanceTimer;

  void buscarUsuarios() async{
    _initTimer();

    if(!isLoading.value){
      isLoading.value = true;
      await _instanceTimer;

      final obterUsuariosDto = ObterUsuariosDto(
        email: emailController.text.toString(),
      );

      final resposta = await ServiceRequest.fetch<UserController>(ObterUsuariosController(
        obterUsuariosDto
      ));

      usuarios = resposta.data["users"] ?? [];
      isLoading.value = false;
    }
  }
}