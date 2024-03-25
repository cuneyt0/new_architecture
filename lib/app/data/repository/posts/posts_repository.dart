import 'package:architecture/app/data/datasource/remote/posts/i_posts_service.dart';
import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/posts/repository/i_posts_repository.dart';
import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:architecture/core/result/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPostsRepository)
class PostsRepository extends IPostsRepository {
  final IPostsService postsService;
  PostsRepository({required this.postsService});
  @override
  ResultDecode<List<PostsEntity>, BaseNetworkErrorType> fethPosts() async {
    final result = await postsService.fethPosts();
    return result.when(
        success: (data) {
          List<PostsEntity> dataList = [];
          for (var element in data) {
            dataList.add(element.mapToEntity());
          }

          return Result.success(dataList);
        },
        failure: (error) => Result.failure(error));
  }
}
