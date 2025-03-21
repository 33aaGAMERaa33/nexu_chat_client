import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:nexu_chat_client/core/models/user_logged_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dotenv/dotenv.dart';

import 'controllers/controller.dart';
import 'controllers/method.dart';


late final String serverUrl;
late final int serverPort;
late final int webSocketPort;

enum HTTPMethods{
  post,
  get;

  isPost(){
    return this == HTTPMethods.post;
  }
  isGet(){
    return this == HTTPMethods.get;
  }
}
class HttpRequestApi {
  static final _instance = HttpRequestApi._();


  late final String _cookiesPath;

  late final Dio _dio;
  late final PersistCookieJar _cookieJar;


  HttpRequestApi._();

  factory HttpRequestApi(){
    return _instance;
  }

  Future<void> init() async{
    final dotEnv = DotEnv();
    dotEnv.load();

    serverUrl = dotEnv["SERVER_URL"] ?? 'http://192.168.15.17';
    serverPort = int.parse(dotEnv["SERVER_PORT"] ?? "8080");
    webSocketPort = int.parse(dotEnv["WEB_SOCKET_PORT"] ?? "8081");

    final directory = await getApplicationSupportDirectory();
    _cookiesPath = ("${directory.path}\\cookies");
    _cookieJar = PersistCookieJar(storage: FileStorage(_cookiesPath));
    _dio = Dio();
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<Response> httpRequest<T extends Controller>({
    required Method<T> method
  }) async{
    String url = method.url;
    Map<String, dynamic> data = method.dto.buildData();
    dynamic resposta;
    Options options = Options();

    if(method.needToken){
      final token = UserLoggedModel().token;

      options.headers = {
        "Authorization": "Bearer $token",
      };
    }


    if(method.httpMethod.isPost()){
      resposta = await _dio.post(url, data: data, options: options);
    }else {
      resposta = await _dio.get(url, data: data, options: options);
    }

    if(data["id"] != null){
      print(method);
      print(data);
    }

    return resposta;
  }
}