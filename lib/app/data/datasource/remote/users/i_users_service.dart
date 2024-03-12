import 'package:architecture/app/data/model/response/users/users.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';

abstract class IUsersService {
  ResultDecode<Users, BaseNetworkErrorType> fetchUsers({int? page});
}
