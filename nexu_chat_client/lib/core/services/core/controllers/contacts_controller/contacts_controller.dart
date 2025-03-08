
import 'package:nexu_chat_client/core/services/core/controller.dart';

class ContactsController extends Controller{
  static final _instance = ContactsController._();
  factory ContactsController() => _instance;
  ContactsController._() : super("contacts");
}