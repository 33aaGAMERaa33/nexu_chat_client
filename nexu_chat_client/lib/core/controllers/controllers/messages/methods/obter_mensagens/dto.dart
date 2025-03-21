import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/mensagem_model.dart';

final class ObterMensagensDto extends Dto{
  final List<MensagemModel> mensagens;
  ObterMensagensDto({required super.status, required super.message, required this.mensagens});

  @override
  String toString() {
    return "${super.toString()} | mensagens: $mensagens";
  }
}