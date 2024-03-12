import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/interfaces/data_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts.g.dart';

@JsonSerializable()
class Posts implements BaseNetworkModel<Posts>, DataMapper<PostsEntity> {
  int? userId;
  int? id;
  String? title;
  String? body;

  Posts({this.body, this.id, this.title, this.userId});

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsToJson(this);

  @override
  Posts fromJson(Map<String, dynamic> json) {
    return Posts.fromJson(json);
  }

  @override
  PostsEntity mapToEntity() {
    return PostsEntity(body: body, userId: userId, title: title);
  }
}
