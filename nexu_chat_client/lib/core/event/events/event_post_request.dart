import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/event/event.dart';
import '../../services/core/controller.dart';
import '../../services/core/method.dart';

class EventPostRequest<T extends Controller> extends Event{
  final Method<T> controller;
  final bool isLoading;
  final Response<dynamic> ? response;

  EventPostRequest({
    required this.controller,
    required this.isLoading,
    required this.response,
  });
}