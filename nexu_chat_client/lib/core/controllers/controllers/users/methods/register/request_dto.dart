import '../../../../request_dto.dart';

final class RegisterRequestDTO extends RequestDto{
  final String username;
  final String email;
  final String password;
  RegisterRequestDTO({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "username": username,
      "email": email,
      "password": password
    };
  }
}