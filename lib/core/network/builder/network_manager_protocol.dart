import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_content_type_enum.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:dio/dio.dart';

abstract class NetworkManagerProtocol {
  NetworkManagerProtocol setPath({required String path});

  NetworkManagerProtocol setRequestMethod(
      {required RequestMethodEnum requestMethodEnum});

  NetworkManagerProtocol setContentType(
      {required RequestContentTypeEnum contentTypeEnum});

  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
      T responseModel);

  ResultResponse<Response, BaseNetworkErrorType> executeResponse();

  NetworkManagerProtocol setQueryParameters(
      {required Map<String, dynamic> queryParameters});

  NetworkManagerProtocol setFunctionName({required String? functionName});

  NetworkManagerProtocol setBody({required Map<String, dynamic>? bodyJson});

  NetworkManagerProtocol setBodyFormData({FormData? formData});

  NetworkManagerProtocol setInterceptor();

  NetworkManagerProtocol setHeaders({required Map<String, dynamic> header});

  NetworkManagerProtocol setResponseTYPE({required ResponseType responseType});
}
