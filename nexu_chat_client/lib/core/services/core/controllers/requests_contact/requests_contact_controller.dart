import 'package:nexu_chat_client/core/services/core/controller.dart';

class RequestsContactController extends Controller{
  static final _instance = RequestsContactController._();
  factory RequestsContactController() => _instance;
  RequestsContactController._() : super("contact-requests");
}