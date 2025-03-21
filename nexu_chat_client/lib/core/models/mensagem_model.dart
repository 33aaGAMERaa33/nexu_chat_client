import 'package:nexu_chat_client/core/models/user_model.dart';

enum MensagemType{
  text,
  video,
  audio;

  static MensagemType parse(String string){
    for(final type in MensagemType.values){
      if(type.toString().split(".")[1].contains(string)){
        return type;
      }
    }

    throw Exception("Não foi possivel converter");
  }
}

class MensagemModel {
  final String contactUUID;
  final UserModel sender;
  final String message;
  final MensagemType type;
  final DateTime ? sentAt;
  MensagemModel({
    required this.message,
    required this.type,
    required this.sender,
    required this.contactUUID,
    this.sentAt
  });
}