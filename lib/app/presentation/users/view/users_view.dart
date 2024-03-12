import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/presentation/users/viewmodel/users_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/error/sw_error.dart';
import 'package:architecture/core/getIt/get_it.dart';
import 'package:architecture/core/result_state_builder/result_state_builder.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends BaseView {
  UsersView({super.key});
  final UsersViewModel _viewModel = getIt.get<UsersViewModel>();

  @override
  void dispose() {}

  @override
  void init() {
    _viewModel
      ..fetchUser()
      ..fetchPosts();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return Consumer<UsersViewModel>(
      builder: (context, consumer, child) => Scaffold(
        appBar: AppBar(
          title: Text("${connectivity.hasConnection}"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          consumer.changeTheme(theme);
          //_viewModel.fetchPosts();
        }),
        body: ResultStateBuilder(
          resultState: consumer.postsResultState,
          completed: (List<PostsEntity> data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text("${data[index].userId}"),
                  title: Text(data[index].title.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ResultStateBuilder<UsersEntity, SwError> _users(UsersViewModel consumer) {
    return ResultStateBuilder(
      resultState: consumer.resultState,
      completed: (UsersEntity data) => ListView.builder(
        itemCount: data.data?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage('${data.data?[index]?.avatar}'),
              ),
              title: Text(data.data?[index]?.firstName.toString() ?? '-'),
            ),
          );
        },
      ),
    );
  }
}
