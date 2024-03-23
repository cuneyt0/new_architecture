import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../viewmodel/user_sub_viewmodel.dart';

class SubUsersView extends BaseView<SubUserViewModel> {
  final SignInDataEntity? data;

  SubUsersView({super.key, required this.data});

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          context.push('${AppRoutes.subsubUserView.childRoute}');
        },
        child: Center(
          child: Text('${data?.firstName}'),
        ),
      ),
    );
  }
}
