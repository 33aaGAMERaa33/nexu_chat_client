import 'package:nexu_chat_client/core/controllers/dto/dto.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';

final class ObterUsersNaoRelacionadosDTO extends Dto{
  final List<UserModel> users;

  ObterUsersNaoRelacionadosDTO({
    required super.status,
    required super.message,
    required this.users
  });
}