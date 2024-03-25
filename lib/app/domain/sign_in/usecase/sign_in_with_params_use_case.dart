import 'package:architecture/app/domain/sign_in/entity/sign_in_entity.dart';
import 'package:architecture/app/domain/sign_in/repository/i_sign_in_repositort.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignInWithParamsUseCase
    implements BaseParamsUseCase<SignInEntity, QueryParameters> {
  final ISignInRepository iDomainSignInRepository;

  SignInWithParamsUseCase({required this.iDomainSignInRepository});

  @override
  ResultDecode<SignInEntity, BaseNetworkErrorType>? call(
      {required QueryParameters? params}) async {
    return await iDomainSignInRepository.signInWithParams(params: params);
  }
}
