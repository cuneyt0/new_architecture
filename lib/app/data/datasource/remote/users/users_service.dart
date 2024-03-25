import 'package:architecture/app/data/datasource/remote/users/i_users_service.dart';
import 'package:architecture/app/data/model/response/users/users.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/getIt/injection.dart';
import '../../../../../core/network/builder/network_manager.dart';

@LazySingleton(as: IUsersService)
class UsersService implements IUsersService {
  final client = getIt.get<NetworkManager>();
  @override
  ResultDecode<Users, BaseNetworkErrorType> fetchUsers({int? page}) async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: 'api/users')
        .setQueryParameters(
            queryParameters: {'page': page}).execute<Users, Users>(Users());
    return response;
  }
}
