import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_content_type_enum.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:dio/dio.dart';

abstract class NetworkManager {
  NetworkManager setPath({required String path});

  NetworkManager setRequestMethod(
      {required RequestMethodEnum requestMethodEnum});

  NetworkManager setContentType(
      {required RequestContentTypeEnum contentTypeEnum});

  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
      T responseModel);

  NetworkManager setQueryParameters(
      {required Map<String, dynamic> queryParameters});


  NetworkManager setBody({required Map<String, dynamic>? bodyJson});

  NetworkManager setBodyFormData({FormData? formData});


  NetworkManager setResponseTYPE({required ResponseType responseType});
}
