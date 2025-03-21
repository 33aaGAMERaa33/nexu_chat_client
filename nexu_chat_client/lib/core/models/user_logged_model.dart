import 'package:nexu_chat_client/core/models/user_model.dart';

final class UserLoggedModel implements UserModel{
  static late UserLoggedModel _instance;
  @override
  final String uuid;
  @override
  final String username;
  @override
  final String email;
  final String token;

  UserLoggedModel.createNew({
    required this.uuid,
    required this.username,
    required this.email,
    required this.token,
  }){
    _instance = this;
  }

  factory UserLoggedModel() => _instance;
}