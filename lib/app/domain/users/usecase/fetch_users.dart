import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/domain/users/repository/i_users_repository.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';

class FetchUsers implements BaseParamsUseCase<UsersEntity, int> {
  final IUsersRepository iDomainUsersRepository;

  FetchUsers({required this.iDomainUsersRepository});

  @override
  ResultDecode<UsersEntity, BaseNetworkErrorType>? call(
      {required int? params}) async {
    return await iDomainUsersRepository.fetchUsers(page: params);
  }
}
