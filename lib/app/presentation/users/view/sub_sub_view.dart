import 'package:architecture/app/presentation/users/viewmodel/user_sub_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';

class SubSubView extends BaseView<SubUserViewModel> {
  SubSubView({super.key});

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("123"),
      ),
    );
  }
}
