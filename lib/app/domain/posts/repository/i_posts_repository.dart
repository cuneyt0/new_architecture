import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';

abstract class IPostsRepository {
  ResultDecode<List<PostsEntity>, BaseNetworkErrorType> fethPosts();
}
