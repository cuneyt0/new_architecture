import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  final int? userId;
  final String? title;
  final String? body;

  const PostsEntity({this.body, this.title, this.userId});

  @override
  List<Object?> get props => [userId, title, body];
}
