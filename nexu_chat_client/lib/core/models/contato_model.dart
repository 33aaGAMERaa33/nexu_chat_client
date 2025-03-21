import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:nexu_chat_client/utils/enum_contact_status.dart';

class ContatoModel implements UserModel{
  @override
  final String uuid;
  @override
  final String username;
  @override
  final String email;

  final String contactUUID;
  final ContactStatus status;

  ContatoModel({
    required this.uuid,
    required this.username,
    required this.email,
    required this.status,
    required this.contactUUID
  });
}