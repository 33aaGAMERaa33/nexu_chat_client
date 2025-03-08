import 'package:flutter/cupertino.dart';

mixin StateMessage {
  final ValueNotifier<String?> message = ValueNotifier(null);
}