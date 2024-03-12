import 'package:architecture/app/client/network_client.dart';
import 'package:architecture/app/data/datasource/remote/users/i_users_service.dart';
import 'package:architecture/app/data/model/response/users/users.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';

class UsersService implements IUsersService {
  @override
  ResultDecode<Users, BaseNetworkErrorType> fetchUsers({int? page}) async {
    final client = await NetworkClient.instance.networkClient();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: 'api/users')
        .setQueryParameters(queryParameters: {'page': page})
        .setFunctionName(functionName: 'fetchUsers')
        .execute<Users, Users>(Users());
    return response;
  }
}
