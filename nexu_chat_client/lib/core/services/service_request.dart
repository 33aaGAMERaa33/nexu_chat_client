
import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/http_request_api.dart';

import '../controllers/controller.dart';
import '../controllers/method.dart';

final class ServiceRequest{
  static final _httpRequestApi = HttpRequestApi();
  ServiceRequest._();

  static Future<dynamic> fetch<T extends Controller>(
      Method<T> method, {Map<String, dynamic>? data, bool? sendEvent = true}
      ) async {
    final event = EventPostRequest(
        method: method,
        isLoading: true,
        responseDto: null
    );

    _sendEvent<T>(event);
    dynamic resultado;

    try {
      resultado = (await _httpRequestApi.httpRequest(method: method));
    } on DioException catch (e) {
      resultado = e.response ?? Response(
        data: {
          "status": "error",
          "message": "Erro desconhecido"
        },
        requestOptions: RequestOptions()
      );

      print(resultado);
    }catch(e, stackTrace){
      print(stackTrace);

      resultado = Response(
          statusCode: 500,
          data: {
            "status": "error",
            "message": "Ouve uma exceção ao realizar a requisição"
          },
          requestOptions: RequestOptions()
      );
    }
    try{
      resultado = method.dtoAdapter.adapter(resultado);
    }catch(e, stackTree){
      print(e);
      print(stackTree);
    }

    event.finish(resultado);
    _sendEvent<T>(event);
    return resultado;
  }

  static void _sendEvent<T extends Controller>(EventPostRequest<T> event){
    EventManager.dispararEvento<EventPostRequest<T>>(event);
  }
}