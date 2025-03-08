import '../../../dto.dart';

class ObterUsuariosDto extends Dto{
  final String ? uuid;
  final String ? username;
  final String ? email;
  final int page;
  ObterUsuariosDto({
    this.uuid,
    this.username,
    this.email,
    this.page = 1
  });

  @override
  Map<String, dynamic>? data() {
    return {
      "uuid": uuid,
      "email": email,
      "page": page
    };
  }
}