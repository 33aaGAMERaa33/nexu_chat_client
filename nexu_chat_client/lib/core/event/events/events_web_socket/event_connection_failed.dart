import 'package:nexu_chat_client/core/event/event.dart';

final class EventSocketConnectionAttemptFailed extends Event{
  final String message;
  EventSocketConnectionAttemptFailed(this.message);
}