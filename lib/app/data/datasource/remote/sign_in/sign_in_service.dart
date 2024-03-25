import 'package:architecture/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/getIt/injection.dart';
import '../../../../../core/network/builder/network_manager.dart';

@LazySingleton(as: ISignInService)
class SignInService implements ISignInService {
  final client = getIt.get<NetworkManager>();

  @override
  ResultDecode<SignIn, BaseNetworkErrorType> signIn(
      {SignInRequestModel? data}) async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setPath(path: 'api/login')
        .setBody(bodyJson: data?.toJson())
        .execute<SignIn, SignIn>(SignIn());
    return response;
  }

  @override
  ResultDecode<SignIn, BaseNetworkErrorType> signInWithParams(
      {required QueryParameters? params}) async {
    final client = getIt.get<NetworkManager>();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setPath(path: 'api/login')
        .setQueryParameters(queryParameters: params!.queryParameters)
        .execute<SignIn, SignIn>(SignIn());
    return response;
  }
}
