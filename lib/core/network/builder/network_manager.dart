import 'dart:developer';
import 'dart:io';

import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/layers/network_connectivity.dart';
import 'package:architecture/core/network/layers/network_decoding.dart';
import 'package:architecture/core/result/result.dart';
import 'package:dio/dio.dart';

import '../enum/request_content_type_enum.dart';
import '../enum/request_method_enum.dart';
import 'network_manager_protocol.dart';

class NetworkManager extends NetworkManagerProtocol {
  final Dio _dio = Dio();
  final bool? isLog;
  final String? releaseBaseURL;
  final String? testBaseURL;
  final bool? isReleaseURL;
  final int? sendTimeOut;
  final int? reciveTimeOut;
  final int? connectionTimeOut;
  final String? authToken;
  Map<String, dynamic>? _queryParameter;
  Map<String, dynamic>? _bodyJson;
  Map<String, dynamic>? _header;
  RequestContentTypeEnum? _contentTypeEnum;
  String? _funcionName;
  FormData? _formData;
  RequestMethodEnum? _requestMethodEnum;
  String? _path;
  ResponseType? _responseType;

  NetworkManager({
    required this.authToken,
    required this.isLog,
    required this.isReleaseURL,
    required this.releaseBaseURL,
    required this.testBaseURL,
    this.reciveTimeOut = 60 * 1000,
    this.sendTimeOut = 100000000,
    this.connectionTimeOut = 60 * 1000,
  });

  @override
  NetworkManagerProtocol setContentType(
      {required RequestContentTypeEnum contentTypeEnum}) {
    _contentTypeEnum = contentTypeEnum;
    return this;
  }

  @override
  NetworkManagerProtocol setPath({required String path}) {
    _path = path;
    return this;
  }

  @override
  NetworkManagerProtocol setRequestMethod(
      {required RequestMethodEnum requestMethodEnum}) {
    _requestMethodEnum = requestMethodEnum;
    return this;
  }

  @override
  NetworkManagerProtocol setQueryParameters(
      {required Map<String, dynamic> queryParameters}) {
    _queryParameter = queryParameters;
    return this;
  }

  @override
  NetworkManagerProtocol setBody({required Map<String, dynamic>? bodyJson}) {
    _bodyJson = bodyJson;
    return this;
  }

  @override
  NetworkManagerProtocol setBodyFormData({FormData? formData}) {
    _formData = formData;
    return this;
  }

  @override
  NetworkManagerProtocol setInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      request.headers['Authorization'] = 'Bearer $authToken';
      request.headers['Accept'] = 'application/json, text/plain, */*';
      request.headers['Content-Type'] = 'application/json';
      handler.next(request);
    }));
    return this;
  }

  @override
  NetworkManagerProtocol setHeaders({required Map<String, dynamic> header}) {
    _header = header;
    return this;
  }

  @override
  NetworkManagerProtocol setFunctionName({required String? functionName}) {
    _funcionName = functionName;
    return this;
  }

  @override
  NetworkManagerProtocol setResponseTYPE({required ResponseType responseType}) {
    _responseType = responseType;
    return this;
  }

  @override
  ResultResponse<Response, BaseNetworkErrorType> executeResponse() async {
    final checkNetwork = await NetworkConnectivity.status;
    if (checkNetwork) {
      try {
        final response = await _dio.fetch(RequestOptions(
            path: _path ?? '',
            method: _requestMethodEnum?.rawValue,
            baseUrl: isReleaseURL == true ? releaseBaseURL : testBaseURL,
            data: _formData ?? _bodyJson,
            connectTimeout: Duration(seconds: connectionTimeOut!),
            receiveTimeout: Duration(seconds: reciveTimeOut!),
            contentType: _contentTypeEnum?.rawValue,
            responseType: _responseType,
            headers: _header,
            queryParameters: _queryParameter,
            sendTimeout: Duration(seconds: sendTimeOut!),
            validateStatus: (statusCode) =>
                statusCode! >= HttpStatus.ok &&
                statusCode <= HttpStatus.multipleChoices));

        if (isLog == true) {
          log('BaseURL ${response.realUri}');
        }

        return Result.success(response);
      } on DioException catch (dioError) {
        if (isLog == true) {
          log('${Result.failure(BaseNetworkErrorType.request(error: dioError))}');
        }
        return Result.failure(BaseNetworkErrorType.request(error: dioError));
      } on TypeError catch (typeError) {
        if (isLog == true) {
          log('${Result.failure(BaseNetworkErrorType.type(error: typeError.toString()))}');
        }
        return Result.failure(
            BaseNetworkErrorType.type(error: typeError.toString()));
      }
    } else {
      if (isLog == true) {
        log('${const Result.failure(BaseNetworkErrorType.connectivity(error: 'No Internet Connection'))}');
      }
      return const Result.failure(
          BaseNetworkErrorType.connectivity(error: 'No Internet Connection'));
    }
  }

  @override
  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
      T responseModel) async {
    if (await NetworkConnectivity.status) {
      try {
        final response = await _dio.fetch(RequestOptions(
            path: _path ?? '',
            method: _requestMethodEnum?.rawValue,
            baseUrl: isReleaseURL == true ? releaseBaseURL : testBaseURL,
            data: _formData ?? _bodyJson,
            connectTimeout: Duration(seconds: connectionTimeOut!),
            receiveTimeout: Duration(seconds: reciveTimeOut!),
            contentType: _contentTypeEnum?.rawValue,
            headers: _header,
            responseType: _responseType ?? ResponseType.json,
            queryParameters: _queryParameter,
            sendTimeout: Duration(seconds: sendTimeOut!),
            validateStatus: (statusCode) =>
                statusCode! >= HttpStatus.ok &&
                statusCode <= HttpStatus.multipleChoices));
        if (isLog == true) {
          log('BaseURL $_funcionName ${response.realUri}');
        }
        final decodeResponse = NetworkDecoding.decode<T, K>(
            response: response, responseType: responseModel);
        return Result.success(decodeResponse);
      } on DioException catch (dioError) {
        if (isLog == true) {
          log('${Result.failure(BaseNetworkErrorType.request(error: dioError))}');
        }
        return Result.failure(BaseNetworkErrorType.request(error: dioError));
      } on TypeError catch (typeError) {
        if (isLog == true) {
          log('${Result.failure(BaseNetworkErrorType.type(error: typeError.toString()))}');
        }
        return Result.failure(
            BaseNetworkErrorType.type(error: typeError.toString()));
      }
    } else {
      if (isLog == true) {
        log('${const Result.failure(BaseNetworkErrorType.connectivity(error: 'No Internet Connection'))}');
      }
      return const Result.failure(
          BaseNetworkErrorType.connectivity(error: 'No Internet Connection'));
    }
  }
}
