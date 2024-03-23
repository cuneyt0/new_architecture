import 'package:dio/dio.dart';

import '../../../app/data/datasource/local/application/application_local_datasource.dart';

class AuthorizationInterceptor extends Interceptor {
  final Dio _dio;
  final ApplicationLocalDataSource _userLocalDataSource;

  AuthorizationInterceptor(
      {required Dio dio,
      required ApplicationLocalDataSource userLocalDataSource})
      : _dio = dio,
        _userLocalDataSource = userLocalDataSource;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": await _userLocalDataSource.getAuthorizationKey(),
      "app-language": "eng",
    });
    // get token from the storage

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      //  await refreshToken();
      try {
        //handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }
    handler.next(err);
  }

/* Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post(APIs.refreshToken,
        options: Options(headers: {"Refresh-Token": "refresh-token"}));
    if (response.statusCode == 200) {
      // LoginRequestResponse requestResponse =
      //    LoginRequestResponse.fromJson(response.data);
      return response;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer ${token}",
      },
    );

    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }*/
}
