import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/posts/repository/i_posts_repository.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';

class FetchPostsUseCase
    implements BaseParamsUseCase<List<PostsEntity>, NoParams> {
  final IPostsRepository iPostsRepository;

  FetchPostsUseCase({required this.iPostsRepository});
  @override
  ResultDecode<List<PostsEntity>, BaseNetworkErrorType>? call(
      {required NoParams? params}) async {
    return await iPostsRepository.fethPosts();
  }
}
