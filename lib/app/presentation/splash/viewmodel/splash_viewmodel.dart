import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/app/presentation/sign_in/view/sign_in_view.dart';
import 'package:architecture/app/presentation/users/view/users_view.dart';
import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/navigation/navigation.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> init() async {
    SignIn? user = _checkUser();
    user == null
        ? Navigation.pushAndRemoveAll(page: const SignInView())
        : Navigation.pushAndRemoveAll(page: UsersView());
  }

  SignIn? _checkUser() {
    return HiveHelper.shared.getData<SignIn>(
        boxName: HiveHelper.userBoxKey, key: HiveHelper.userKey);
  }
}
