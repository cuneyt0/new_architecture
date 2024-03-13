import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/posts/usecase/fetch_posts_usecase.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/domain/users/usecase/fetch_users.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/error/sw_error.dart';
import 'package:architecture/core/firebase/analytics/analytics_manager.dart';
import 'package:architecture/core/firebase/crashlytics/crashlytics_manager.dart';
import 'package:architecture/core/network/interfaces/base_use_case.dart';
import 'package:architecture/core/results/result_state.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends BaseViewModel {
  final FetchUsers fetchUsers;
  final FetchPostsUseCase fetchPostsUseCase;
  UsersViewModel({required this.fetchUsers, required this.fetchPostsUseCase});
  ResultState<UsersEntity, SwError> resultState = const ResultState.idle();
  bool get isSearch => _isSearch;
  bool _isSearch = false;

  TextEditingController searchController = TextEditingController();
  ResultState<List<PostsEntity>, SwError> postsResultState =
      const ResultState.idle();

  List<PostsEntity> _searchResults = [];
  List<PostsEntity>? filterData = [];

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
    AnalyticsManager.instance
        .sendALog(name: "fetchUser", parameters: {"name": "fetchUser"});

    notify();
  }

  Future<void> fetchPosts() async {
    postsResultState = const ResultState.pending();
    final result = await fetchPostsUseCase.call(params: NoParams());
    result?.when(
      success: (data) {
        postsResultState = ResultState.completed(data);
        _searchResults = data;
      },
      failure: (error) async {
        postsResultState = ResultState.failed(
            SwError(errorMessage: error.localizedErrorMessage));
        await CrashlyticsManager.instance.sendACrash(
            error: error.localizedErrorMessage,
            stackTrace: StackTrace.current,
            isFatal: true,
            reason: "Error fetchPost ");
      },
    );
    AnalyticsManager.instance
        .sendALog(name: "Fetch Post", parameters: {"name": "Fetch Post"});
    notify();
  }

  void changeTheme(ThemeManager theme) {
    if (theme.themeType == ThemeType.light) {
      theme.changeTheme(to: ThemeType.dark);
    } else {
      theme.changeTheme(to: ThemeType.light);
    }
  }

  void searchButtonOnTap() {
    _isSearch = !_isSearch;
    if (isSearch == false) {
      filterData = _searchResults;
      searchController.clear();
    }
    notify();
  }

  //Data filtering
  controllerChanged() async {
    filterData = _searchResults
        .where((item) => (item.title!.contains(searchController.text) ||
            item.title!.contains(searchController.text)))
        .toList();

    await AnalyticsManager.instance.logSearch(searchController.text);

    notify();
  }
}
