import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/navigation/app_navigation.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> init() async {
    SignIn? user = _checkUser();
    user == null
        ? AppNavigation.navigatorKey.currentState?.context
            .goNamed(AppRoutes.signInView.name)
        : AppNavigation.navigatorKey.currentState?.context
            .goNamed(AppRoutes.usersView.name);
  }

  SignIn? _checkUser() {
    return HiveHelper.shared.getData<SignIn>(
        boxName: HiveHelper.userBoxKey, key: HiveHelper.userKey);
  }
}
