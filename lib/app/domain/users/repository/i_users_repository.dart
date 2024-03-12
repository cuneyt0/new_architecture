import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';

abstract class IUsersRepository {
  ResultDecode<UsersEntity, BaseNetworkErrorType> fetchUsers({int? page});
}
