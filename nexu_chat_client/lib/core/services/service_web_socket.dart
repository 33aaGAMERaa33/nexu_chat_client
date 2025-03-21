import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_mensagem_recebida.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/utils/string_to_enum.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum _ServerMessages {
  message,
  connectionAttempt,
  newMessageReceived;

  @override
  toString(){
    final string = super.toString().split(".")[1];
    String stringFormated = "";

    for(final char in string.characters){
      String formated;
      final charUpperCase = char.toUpperCase();

      if(char == charUpperCase){
        formated = "-${char.toLowerCase()}";
      }else{
        formated = char;
      }

      stringFormated += formated;
    }

    return stringFormated;
  }
}

final class ServiceWebSocket {
  static final _timeout = const Duration(seconds: 2);
  static late IO.Socket _socket;

  static IO.Socket _buildSocket(){
    return IO.io("$serverUrl:$webSocketPort", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }

  static void init(){
    _socket = _buildSocket();

    _socket.onConnect((_){
      print("Conectado");
    });
    _socket.onDisconnect((_){
      print("Disconectado");
    });
    _socket.on(_ServerMessages.newMessageReceived.toString(), (data) {
      EventManager.dispararEvento<EventMensagemRecebida>(EventMensagemRecebida(
        MensagemModel(
          sender: UserModel(
            uuid: data["sender"]["uuid"],
            username: data["sender"]["username"],
            email: data["sender"]["email"],
          ),
          contactUUID: data["contact_uuid"],
          message: data["message"],
          type: parseEnum(MensagemType.values, data["type"]),
        )
      ));
    },);
  }
  static void dispose(){
    _socket.dispose();
    _socket.destroy();
  }
  static Future<bool> connect({bool reconnectIfConnected = false}) async{
    if(_socket.disconnected){
      final completer = Completer<bool>();

      _socket.once("connect", (_){
        if(!completer.isCompleted) {
          _socket.once("connection-status", (msg){
            if(msg["status"] == "success"){
              completer.complete(true);
            }else{
              _socket.disconnect();
              completer.complete(false);
            }
          });
        }
      });

      Future.delayed(_timeout, () {
        if(!completer.isCompleted){
          completer.complete(false);
        }
      });
      
      _socket.connect();

      return completer.future;
    }else if(reconnectIfConnected){
      _socket.disconnect();
      return await connect();
    }else{
      return false;
    }
  }
  static void disconnect() async{
    _socket.disconnect();
  }
  static void setToken(String token){
    _socket.io.options?["extraHeaders"] = {
      "authorization": "Bearer $token"
    };
  }
}