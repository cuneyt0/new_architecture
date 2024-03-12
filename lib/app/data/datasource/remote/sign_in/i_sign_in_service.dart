import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';

abstract class ISignInService {
  ResultDecode<SignIn, BaseNetworkErrorType> signInWithParams(
      {required QueryParameters? params});
  ResultDecode<SignIn, BaseNetworkErrorType> signIn({SignInRequestModel? data});
}
