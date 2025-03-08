import 'package:nexu_chat_client/core/services/core/dto.dart';

class LoginUserDto extends Dto {
  final String email;
  final String password;

  LoginUserDto({
    required this.email,
    required this.password
  });

  @override
  Map<String, dynamic>? data() {
    return {
      "email": email,
      "password": password
    };
  }
}