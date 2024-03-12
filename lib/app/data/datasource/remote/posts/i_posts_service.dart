import 'package:architecture/app/data/model/response/posts/posts.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';

abstract class IPostsService {
  ResultDecode<List<Posts>, BaseNetworkErrorType> fethPosts();
}
