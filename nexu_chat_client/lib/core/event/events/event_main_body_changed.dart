import 'package:nexu_chat_client/core/event/event.dart';
import 'package:nexu_chat_client/features/main/body/body_view_controller.dart';

final class EventMainBodyChanged extends Event{
  final MainBodyState bodyState;
  EventMainBodyChanged(this.bodyState);
}