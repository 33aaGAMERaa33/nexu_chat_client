
import 'package:dio/dio.dart';
import 'package:nexu_chat_client/core/event/event_manager.dart';
import 'package:nexu_chat_client/core/event/events/event_post_request.dart';
import 'package:nexu_chat_client/core/http_request_api/http_request_api.dart';

import 'core/controller.dart';
import 'core/method.dart';

final class ServiceRequest{
  static final _httpRequestApi = HttpRequestApi();
  ServiceRequest._();

  static Future<Response<dynamic>> fetch<T extends Controller>(
      Method<T> method, {Map<String, dynamic>? data, bool? sendEvent = true}
      ) async {
    _sendEvent<T>(method: method, response: null, isLoading: true);
    Response<dynamic> resultado;

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

    _sendEvent<T>(method: method, response: resultado, isLoading: false);
    return resultado;
  }

  static void _sendEvent<T extends Controller>({
    required Method<T> method,
    required Response<dynamic> ? response,
    required bool isLoading
  }){
    EventManager.dispararEvento<EventPostRequest<T>>(EventPostRequest<T>(
        controller: method,
        isLoading: isLoading,
        response: response)
    );
  }
}