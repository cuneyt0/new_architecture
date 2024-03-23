import 'package:architecture/app/data/model/request/sign_in_request_model/sign_in_request_model.dart';
import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_entity.dart';
import 'package:architecture/app/domain/sign_in/usecase/sign_in_with_params_use_case.dart';
import 'package:architecture/app/domain/sign_in/usecase/sing_in_use_case.dart';
import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:architecture/core/error/sw_error.dart';
import 'package:architecture/core/error/view_error.dart';
import 'package:architecture/core/navigation/app_navigation.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:architecture/core/results/view_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SignInViewModel extends BaseViewModel {
  final SignInWithParamsUseCase signInWithParamsUseCase;
  final SignInUseCase signInUseCase;
  SignInViewModel(
      {required this.signInWithParamsUseCase, required this.signInUseCase});
  ViewState<SignInEntity, SwError> resultState = const ViewState.idle();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInRequestModel? signInRequestModel = SignInRequestModel();

  Future<void> signIn(BuildContext context) async {
    signInRequestModel = SignInRequestModel(
        email: emailController.text, password: passwordController.text);
    resultState = const ViewState.idle();
    final result = await signInUseCase.call(params: signInRequestModel);

    result?.when(
      success: (data) async {
        resultState = ViewState.completed(data);
        await _saveHive(data: data);
        if (context.mounted) {
          context.goNamed(AppRoutes.usersView.name);
        } else {}
      },
      failure: (error) {
        ScaffoldMessenger.of(AppNavigation.navigatorKey.currentState!.context)
            .showSnackBar(SnackBar(
          content: Text('${error.handleError.error}'),
        ));
        return ViewState.failed(ViewError(error: error.handleError.error));
      },
    );

    notify();
  }

  Future<void> _saveHive({SignInEntity? data}) async {
    await HiveHelper.shared.clear<SignIn>(boxName: HiveHelper.userBoxKey);
    await HiveHelper.shared.put<SignIn>(
        boxName: HiveHelper.userBoxKey,
        key: HiveHelper.userKey,
        data: SignIn(token: data?.token));
  }
}
