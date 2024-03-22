import 'package:architecture/app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:architecture/app/presentation/splash/viewmodel/splash_viewmodel.dart';
import 'package:architecture/app/presentation/users/viewmodel/users_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../getIt/injection.dart';

class Providers {
  static final providers = [
    ChangeNotifierProvider<ThemeManager>(
        create: (BuildContext context) => ThemeManager()),
    ChangeNotifierProvider<ConnectivityController>(
        create: (BuildContext context) => getIt.get<ConnectivityController>()),
    ChangeNotifierProvider<SplashViewModel>(
      create: (BuildContext context) => getIt.get<SplashViewModel>(),
    ),
    ChangeNotifierProvider<UsersViewModel>(
      create: (BuildContext context) => getIt.get<UsersViewModel>(),
    ),
    ChangeNotifierProvider<SignInViewModel>(
      create: (BuildContext context) => getIt.get<SignInViewModel>(),
    ),
  ];
}
