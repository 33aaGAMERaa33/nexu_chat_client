import 'package:nexu_chat_client/core/controllers/controller.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';

final class ContactsController extends Controller{
  static final _instance = ContactsController._();
  factory ContactsController() => _instance;

  ContactsController._() : super("contacts");

  static Future<dynamic> fetch(Method<ContactsController> method) async{
    return ServiceRequest.fetch<ContactsController>(method);
  }
}