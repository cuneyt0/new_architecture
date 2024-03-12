import 'package:architecture/app/presentation/splash/viewmodel/splash_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/getIt/get_it.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashView extends BaseView {
  final SplashViewModel _viewModel = getIt.get<SplashViewModel>();

  SplashView({super.key});
  @override
  void dispose() {}

  @override
  void init() async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _viewModel.init();
    });
  }

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
