import 'package:flutter/cupertino.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/features/main/body/body_view_controller.dart';

import '../../../core/event/events/event_main_body_changed.dart';

final class MainBodyView extends StatefulWidget{
  final MainBodyViewController viewController;
  MainBodyView({super.key}) : viewController = MainBodyViewController();

  @override
  State<StatefulWidget> createState() {
    return _MainBodyViewState();
  }
}
final class _MainBodyViewState extends State<MainBodyView>{
  @override
  Widget build(BuildContext context) {
    return widget.viewController.bodyState.widget();
  }

  void _changeBodyHandler(EventMainBodyChanged event){
    if(mounted){
      final bodyState = widget.viewController.bodyState;

      if(bodyState != event.bodyState){
        setState(() {
          widget.viewController.bodyState = event.bodyState;
        });
      }
    }
  }
  @override
  void initState() {
    super.initState();
    EventManager.addListener<EventMainBodyChanged>(_changeBodyHandler);
  }
  @override
  void dispose() {
    super.dispose();
    EventManager.removeListener<EventMainBodyChanged>(_changeBodyHandler);
  }
}