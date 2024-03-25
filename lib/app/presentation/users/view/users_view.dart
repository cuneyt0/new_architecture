// ignore_for_file: unused_element

import 'package:architecture/app/component/no_connection_view.dart';
import 'package:architecture/app/domain/posts/entity/posts_entity.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/app/presentation/users/viewmodel/users_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:architecture/core/result_state_builder/result_state_builder.dart';
import 'package:architecture/core/results/view_state.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part '../widgets/_appbar.dart';
part '../widgets/_searchbody.dart';

class UsersView extends BaseView<UsersViewModel> {
  UsersView({super.key});

  @override
  void dispose() {}

  @override
  void init() {
    viewModel.fetchUser();
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return connectivity.hasConnection == false
        ? const NoConnectionView()
        : Scaffold(
            appBar: _appbar(viewModel),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              await viewModel.fetchPosts();

              /**
         *   await CrashlyticsManager.instance.sendACrash(
              error: Exception('Custom Message'),
              stackTrace: StackTrace.current,
              isFatal: true,
              reason: "Sebeb ");
         */

              /**
           *  crashlyticsManager.sendACrash(
          error: e,
          stackTrace: StackTrace.current,
          reason: "Error uploadImage");
           */
              //   throw Exception('Random Message');
            }),
            body: Selector<UsersViewModel, bool>(
                selector: (_, provider) =>
                    provider.searchController.text.isNotEmpty,
                builder: (context, value, child) {
                  return value ? _searchbody() : _body(viewModel, context);
                }),
          );
  }

  Widget _body(UsersViewModel consumer, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _users(consumer),
        ),
      ],
    );
  }

  Selector<UsersViewModel, ViewState<dynamic, Exception>> _posts(
      UsersViewModel consumer) {
    return Selector<UsersViewModel, ViewState>(
      builder: (context, value, child) {
        return ResultStateBuilder(
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
        );
      },
      selector: (_, provider) => provider.postsResultState,
    );
  }

  Selector<UsersViewModel, ViewState<dynamic, Exception>> _users(
      UsersViewModel consumer) {
    return Selector<UsersViewModel, ViewState>(
      builder: (context, value, child) {
        print("Rebuild Users");
        return ResultStateBuilder(
            resultState: consumer.resultState,
            completed: (UsersEntity data) {
              return ListView.builder(
                itemCount: data.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        context.go('${AppRoutes.subUsersView.childRoute}',
                            extra: data.data?[index]);
                      },
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage:
                            NetworkImage('${data.data?[index]?.avatar}'),
                      ),
                      title:
                          Text(data.data?[index]?.firstName.toString() ?? '-'),
                    ),
                  );
                },
              );
            });
      },
      selector: (_, provider) => provider.resultState,
    );
  }
}
