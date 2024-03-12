
import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/posts/usecase/fetch_posts_usecase.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/domain/users/usecase/fetch_users.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/error/sw_error.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:architecture/core/results/result_state.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends BaseViewModel {
  final FetchUsers fetchUsers;
  final FetchPostsUseCase fetchPostsUseCase;
  UsersViewModel({required this.fetchUsers, required this.fetchPostsUseCase});
  ResultState<UsersEntity, SwError> resultState = const ResultState.idle();
  ResultState<List<PostsEntity>, SwError> postsResultState =
      const ResultState.idle();

  Future<void> fetchUser() async {
    resultState = const ResultState.idle();
    final result = await fetchUsers.call(params: 2);
    result?.when(
      success: (data) {
        resultState = ResultState.completed(data);
      },
      failure: (error) {
        debugPrint(error.localizedErrorMessage);
        resultState = ResultState.failed(
            SwError(errorMessage: error.localizedErrorMessage));
      },
    );
    notify();
  }

  Future<void> fetchPosts() async {
    postsResultState = const ResultState.pending();
    final result = await fetchPostsUseCase.call(params: NoParams());
    result?.when(
      success: (data) {
        postsResultState = ResultState.completed(data);
      },
      failure: (error) {
        debugPrint(error.localizedErrorMessage);
        postsResultState = ResultState.failed(
            SwError(errorMessage: error.localizedErrorMessage));
      },
    );
    notify();
  }

  void changeTheme(ThemeManager theme) {
    if (theme.themeType == ThemeType.light) {
      theme.changeTheme(to: ThemeType.dark);
    } else {
      theme.changeTheme(to: ThemeType.light);
    }
  }
}
