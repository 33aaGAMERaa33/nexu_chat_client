import 'package:nexu_chat_client/core/controllers/controller.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';

final class UsersController extends Controller{
  static final _instance = UsersController._();
  factory UsersController() => _instance;

  UsersController._() : super("users");

  static Future<dynamic> fetch(Method<UsersController> method) async{
    return ServiceRequest.fetch<UsersController>(method);
  }
}