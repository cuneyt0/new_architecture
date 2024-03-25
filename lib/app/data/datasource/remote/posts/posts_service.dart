import 'package:architecture/app/data/datasource/remote/posts/i_posts_service.dart';
import 'package:architecture/app/data/model/response/posts/posts.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/network/builder/network_manager.dart';

@LazySingleton(as: IPostsService)
class PostsService extends IPostsService {
  final client = getIt.get<NetworkManager>();

  @override
  ResultDecode<List<Posts>, BaseNetworkErrorType> fethPosts() async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setPath(path: 'posts')
        .execute<Posts, List<Posts>>(Posts());
    return response;
  }
}
