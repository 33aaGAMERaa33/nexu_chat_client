import 'package:nexu_chat_client/core/services/core/dto.dart';

enum StatusContatos{
  active,
  blocked;
}
class ObterContatosPorDadosDto extends Dto{
  final StatusContatos statusContatos;
  final int page;

  ObterContatosPorDadosDto({
    required this.statusContatos,
    this.page = 1
  });

  @override
  Map<String, dynamic> ? data(){
    return {
      "status": statusContatos.toString().split(".")[1],
      'page': page
    };
  }
}