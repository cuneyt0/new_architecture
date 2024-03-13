import 'package:architecture/app/client/network_client.dart';
import 'package:architecture/app/data/datasource/remote/posts/i_posts_service.dart';
import 'package:architecture/app/data/model/response/posts/posts.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/enum/request_method_enum.dart';

class PostsService extends IPostsService {
  @override
  ResultDecode<List<Posts>, BaseNetworkErrorType> fethPosts() async {
    final client = await NetworkClient.instance.postsNetworkClient();
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setPath(path: 'posts')
        .setFunctionName(functionName: 'fethPosts')
        .execute<Posts, List<Posts>>(Posts());
    return response;
  }
}
