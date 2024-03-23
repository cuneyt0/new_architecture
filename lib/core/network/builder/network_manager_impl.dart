import 'dart:io';

import 'package:architecture/app/data/datasource/local/application/application_local_datasource.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/network/builder/third_party_managers.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/layers/network_connectivity.dart';
import 'package:architecture/core/network/layers/network_decoding.dart';
import 'package:architecture/core/result/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../enum/request_method_enum.dart';
import '../interceptors/authorization_interceptor.dart';
import 'network_manager.dart';

@Injectable(as: NetworkManager)
class NetworkManagerImpl extends NetworkManager {
  final Dio _dio = getIt.get<ThirdPartyManagers>().dio;
  final ApplicationLocalDataSource _userLocalDataSource =
      getIt.get<ApplicationLocalDataSource>();
  Map<String, dynamic>? _queryParameter;
  Map<String, dynamic>? _bodyJson;
  Map<String, dynamic>? _header;
  FormData? _formData;
  RequestMethodEnum? _requestMethodEnum;
  String? _path;

  @override
  NetworkManager setPath({required String path}) {
    _path = path;
    return this;
  }

  @override
  NetworkManager setRequestMethod(
      {required RequestMethodEnum requestMethodEnum}) {
    _requestMethodEnum = requestMethodEnum;
    return this;
  }

  @override
  NetworkManager setQueryParameters(
      {required Map<String, dynamic> queryParameters}) {
    _queryParameter = queryParameters;
    return this;
  }

  @override
  NetworkManager setBody({required Map<String, dynamic>? bodyJson}) {
    _bodyJson = bodyJson;
    return this;
  }

  @override
  NetworkManager setBodyFormData({FormData? formData}) {
    _formData = formData;
    return this;
  }

  @override
  NetworkManager setHeaders({required Map<String, dynamic> header}) {
    _header = header;
    return this;
  }

  @override
  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
      T responseModel) async {
    if (await NetworkConnectivity.status) {
      try {
        _dio.interceptors.add(AuthorizationInterceptor(
            userLocalDataSource: _userLocalDataSource, dio: _dio));
        _dio.options.connectTimeout = const Duration(seconds: 20);
        _dio.options.receiveTimeout = const Duration(seconds: 10);
        _dio.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90));
        final response = await _dio.fetch(RequestOptions(
            path: _path ?? '',
            method: _requestMethodEnum?.rawValue,
            data: _formData ?? _bodyJson,
            baseUrl: "https://reqres.in/",
            headers: _header,
            queryParameters: _queryParameter,
            validateStatus: (statusCode) =>
                statusCode! >= HttpStatus.ok &&
                statusCode <= HttpStatus.multipleChoices));
        final decodeResponse = NetworkDecoding.decode<T, K>(
            response: response, responseType: responseModel);
        return Result.success(decodeResponse);
      } on DioException catch (dioError) {
        return Result.failure(BaseNetworkErrorType.request(error: dioError));
      } on TypeError catch (typeError) {
        return Result.failure(
            BaseNetworkErrorType.type(error: typeError.toString()));
      }
    } else {
      return const Result.failure(
          BaseNetworkErrorType.connectivity(error: 'No Internet Connection'));
    }
  }
}
