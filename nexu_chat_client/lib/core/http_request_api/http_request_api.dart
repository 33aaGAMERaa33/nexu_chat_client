import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:nexu_chat_client/core/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

import '../services/core/controller.dart';
import '../services/core/method.dart';


const String serverUrl = "http://localhost";
const int serverPort = 3000;

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
    final directory = await getApplicationSupportDirectory();
    _cookiesPath = ("${directory.path}\\cookies");
    _cookieJar = PersistCookieJar(storage: FileStorage(_cookiesPath));
    _dio = Dio();
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<Response<dynamic>> httpRequest<T extends Controller>({
    required Method<T> method
  }) async{
    String url = method.url;
    Map<String, dynamic> data = method.buildData();
    Response<dynamic> resposta;
    Options options = Options();

    if(method.needToken){
      options.headers = {
        "Authorization": "Bearer ${UserModel.token}",
      };
    }


    if(method.httpMethod.isPost()){
      resposta = await _dio.post(url, data: data, options: options);
    }else{
      resposta = await _dio.get(url, data: data, options: options);
    }

    return resposta;
  }
}