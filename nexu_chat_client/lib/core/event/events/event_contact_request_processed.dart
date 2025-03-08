import 'package:nexu_chat_client/core/event/event.dart';
import 'package:nexu_chat_client/core/services/core/controllers/requests_contact/utils/status_requests_contact.dart';

class EventContactRequestProcessed extends Event{
  final int ? contactRequestId;
  final String ? username;
  final String ? email;
  late final StatusRequestsContact ? status;
  EventContactRequestProcessed({
    required this.contactRequestId,
    required this.username,
    required this.email,
    required String ? status,
  }){
    this.status = stringToStatusRequestsContact(status);
  }
}