import 'package:nexu_chat_client/core/controllers/controller.dart';
import 'package:nexu_chat_client/core/controllers/method.dart';
import 'package:nexu_chat_client/core/services/service_request.dart';

final class ContactRequestsController extends Controller{
  static final _instance = ContactRequestsController._();
  factory ContactRequestsController() => _instance;

  ContactRequestsController._() : super("contact-requests");

  static Future<dynamic> fetch(Method<ContactRequestsController> method) async{
    return ServiceRequest.fetch<ContactRequestsController>(method);
  }
}