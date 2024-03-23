import 'dart:io';

import 'package:architecture/app/client/dio_manager.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/layers/network_connectivity.dart';
import 'package:architecture/core/network/layers/network_decoding.dart';
import 'package:architecture/core/result/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../enum/request_content_type_enum.dart';
import '../enum/request_method_enum.dart';
import 'network_manager.dart';

@Injectable(as: NetworkManager)
class NetworkManagerImpl extends NetworkManager {
  final Dio _dio = getIt.get<DioManager>().getDio();
  Map<String, dynamic>? _queryParameter;
  Map<String, dynamic>? _bodyJson;
  RequestContentTypeEnum? _contentTypeEnum;
  FormData? _formData;
  RequestMethodEnum? _requestMethodEnum;
  String? _path;
  ResponseType? _responseType;


  @override
  NetworkManager setContentType(
      {required RequestContentTypeEnum contentTypeEnum}) {
    _contentTypeEnum = contentTypeEnum;
    return this;
  }

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
  NetworkManager setResponseTYPE({required ResponseType responseType}) {
    _responseType = responseType;
    return this;
  }

  @override
  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
      T responseModel) async {
    if (await NetworkConnectivity.status) {
      try {
        final response = await _dio.fetch(RequestOptions(
            path: _path ?? '',
            method: _requestMethodEnum?.rawValue,
            data: _formData ?? _bodyJson,
            baseUrl: "https://reqres.in/",
            contentType: _contentTypeEnum?.rawValue,
            responseType: _responseType ?? ResponseType.json,
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
