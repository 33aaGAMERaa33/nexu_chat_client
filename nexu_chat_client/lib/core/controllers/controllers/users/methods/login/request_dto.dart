import '../../../../request_dto.dart';

final class LoginRequestDTO extends RequestDto{
  final String email;
  final String password;
  LoginRequestDTO({
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> buildData() {
    return {
      "email": email,
      "password": password
    };
  }
}