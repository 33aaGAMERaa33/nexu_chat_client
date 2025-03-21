import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

final class LoginResponseDTO extends Dto implements UserModel{
  @override
  final String uuid;
  @override
  final String username;
  @override
  final String email;

  final String token;

  LoginResponseDTO({
    required super.status,
    required super.message,
    required this.uuid,
    required this.username,
    required this.email,
    required this.token,
  });
}