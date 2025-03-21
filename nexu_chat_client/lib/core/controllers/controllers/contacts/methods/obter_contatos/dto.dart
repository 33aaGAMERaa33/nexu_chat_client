import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/contato_model.dart';

final class ObterContatosDto extends Dto{
  final List<ContatoModel> contatos;
  ObterContatosDto({
    required super.status,
    required super.message,
    required this.contatos,
  });

  @override
  String toString() {
    return "${super.toString()} | contatos: $contatos";
  }
}