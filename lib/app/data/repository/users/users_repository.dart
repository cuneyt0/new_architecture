import 'package:architecture/app/data/datasource/remote/users/i_users_service.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/domain/users/repository/i_users_repository.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/result/result.dart';

class UsersRepository implements IUsersRepository {
  final IUsersService iUsersService;

  UsersRepository({required this.iUsersService});

  @override
  ResultDecode<UsersEntity, BaseNetworkErrorType> fetchUsers(
      {int? page}) async {
    final result = await iUsersService.fetchUsers(page: page);
    return result.when(
        success: (data) => Result.success(data.mapToEntity()),
        failure: (error) => Result.failure(error));
  }
}
