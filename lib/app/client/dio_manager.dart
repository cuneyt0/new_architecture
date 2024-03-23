import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptor.dart';

@Singleton()
class DioManager{
  final Dio dio = Dio();

   Dio getDio(){
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.headers['content-Type'] = 'application/json';

    dio.interceptors.add(
        DioInterceptor(dio: dio));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

}