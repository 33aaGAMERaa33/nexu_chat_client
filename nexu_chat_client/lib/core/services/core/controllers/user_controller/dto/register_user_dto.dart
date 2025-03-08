import 'package:nexu_chat_client/core/services/core/dto.dart';

class RegisterUserDto extends Dto{
  final String username;
  final String email;
  final String password;

  RegisterUserDto({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic>? data() {
    return {
      "username": username,
      "email": email,
      "password": password,
    };
  }
}