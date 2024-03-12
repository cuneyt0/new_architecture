import 'package:architecture/app/client/network_client.dart';
import 'package:architecture/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';

class SignInService implements ISignInService {
  @override
  ResultDecode<SignIn, BaseNetworkErrorType> signIn(
      {SignInRequestModel? data}) async {
    final client = await NetworkClient.instance.networkClient();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setPath(path: 'api/login')
        .setBody(bodyJson: data?.toJson())
        .setFunctionName(functionName: 'signIn')
        .execute<SignIn, SignIn>(SignIn());
    return response;
  }

  @override
  ResultDecode<SignIn, BaseNetworkErrorType> signInWithParams(
      {required QueryParameters? params}) async {
    final client = await NetworkClient.instance.networkClient();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setPath(path: 'api/login')
        .setQueryParameters(queryParameters: params!.queryParameters)
        .setFunctionName(functionName: 'signInWithParams')
        .execute<SignIn, SignIn>(SignIn());
    return response;
  }
}
