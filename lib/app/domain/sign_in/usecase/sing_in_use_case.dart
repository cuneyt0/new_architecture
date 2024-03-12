import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_entity.dart';
import 'package:architecture/app/domain/sign_in/repository/i_sign_in_repositort.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';

class SignInUseCase
    implements BaseParamsUseCase<SignInEntity, SignInRequestModel?> {
  final ISignInRepository iDomainSignInRepository;

  SignInUseCase({required this.iDomainSignInRepository});
  @override
  ResultDecode<SignInEntity, BaseNetworkErrorType>? call(
      {required SignInRequestModel? params}) async {
    return await iDomainSignInRepository.signIn(data: params);
  }
}
