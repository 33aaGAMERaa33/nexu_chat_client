import 'package:flutter/cupertino.dart';

mixin StateIsLoading {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
}