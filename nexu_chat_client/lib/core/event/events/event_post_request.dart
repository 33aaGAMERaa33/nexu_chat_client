import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/event/event.dart';
import '../../controllers/controller.dart';
import '../../controllers/method.dart';

class EventPostRequest<T extends Controller> extends Event{
  late Method<T> _method;
  late bool _isLoading;
  late dynamic _responseDto;

  Method<T> get method => _method;
  bool get isLoading => _isLoading;
  dynamic get responseDto => _responseDto;

  EventPostRequest({
    required Method<T> method,
    required bool isLoading,
    required dynamic responseDto,
  }){
    _method = method;
    _isLoading = isLoading;
    _responseDto = responseDto;
  }

  void finish(responseDto){
    _isLoading = false;
    _responseDto = responseDto;
  }
}