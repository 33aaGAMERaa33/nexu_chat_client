import 'package:nexu_chat_client/core/controllers/controller.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';

final class MessagesController extends Controller{
  static final _instance = MessagesController._();
  factory MessagesController() => _instance;

  MessagesController._() : super("messages");

  static Future<dynamic> fetch(Method<MessagesController> method) async{
    return ServiceRequest.fetch<MessagesController>(method);
  }
}