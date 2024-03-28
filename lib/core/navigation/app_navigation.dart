import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/presentation/notification/view/notification_view.dart';
import 'package:architecture/app/presentation/sign_in/view/sign_in_view.dart';
import 'package:architecture/app/presentation/splash/view/splash_view.dart';
import 'package:architecture/app/presentation/users/view/sub_sub_view.dart';
import 'package:architecture/app/presentation/users/view/sub_users_view.dart';
import 'package:architecture/app/presentation/users/view/users_view.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppNavigation {
  static final String _initRoute = AppRoutes.splashView.path;
  //Navigator Key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: _initRoute,
    routes: [
      //Splash
      GoRoute(
        path: AppRoutes.splashView.path,
        name: AppRoutes.splashView.name,
        builder: (context, state) => SplashView(
          key: state.pageKey,
        ),
      ),
      //SignInView
      GoRoute(
        path: AppRoutes.signInView.path,
        name: AppRoutes.signInView.name,
        builder: (context, state) => SignInView(
          key: state.pageKey,
        ),
      ),
      //UsersView
      GoRoute(
          path: AppRoutes.usersView.path,
          name: AppRoutes.usersView.name,
          builder: (context, state) => UsersView(
                key: state.pageKey,
              ),
          routes: [
            //SubUsersView
            GoRoute(
                path: AppRoutes.subUsersView.path,
                name: AppRoutes.subUsersView.name,
                builder: (context, state) => SubUsersView(
                      key: state.pageKey,
                      data: state.extra as SignInDataEntity?,
                    ),
                routes: [
                  //Sub Sub View
                  GoRoute(
                    path: AppRoutes.subsubUserView.path,
                    name: AppRoutes.subsubUserView.name,
                    builder: (context, state) => SubSubView(
                      key: state.pageKey,
                    ),
                  ),
                ]),
          ]),
      //NotificationView
      GoRoute(
        path: AppRoutes.notificationView.path,
        name: AppRoutes.notificationView.name,
        builder: (context, state) => NotificationView(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
