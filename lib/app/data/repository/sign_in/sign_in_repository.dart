import 'package:architecture/app/data/datasource/local/application/application_local_datasource.dart';
import 'package:architecture/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_entity.dart';
import 'package:architecture/app/domain/sign_in/repository/i_sign_in_repositort.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:architecture/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ISignInRepository)
class SignInRepository implements ISignInRepository {
  final ISignInService iSignInService;
  final ApplicationLocalDataSource applicationLocalDataSource = getIt.get<
      ApplicationLocalDataSource>();

  SignInRepository({required this.iSignInService});

  @override
  ResultDecode<SignInEntity, BaseNetworkErrorType> signIn(
      {SignInRequestModel? data}) async {
    final result = await iSignInService.signIn(data: data);
    result.when(success: (data)=>applicationLocalDataSource.saveAuthorizationKey(data.token ?? ""), failure: (fail)=>{});
    return result.when(
        success: (data) => Result.success(data.mapToEntity()),
        failure: (error) => Result.failure(error));
  }

  @override
  ResultDecode<SignInEntity, BaseNetworkErrorType> signInWithParams(
      {required QueryParameters? params}) async {
    final result = await iSignInService.signInWithParams(params: params);
    return result.when(
        success: (data) => Result.success(data.mapToEntity()),
        failure: (error) => Result.failure(error));
  }
}
