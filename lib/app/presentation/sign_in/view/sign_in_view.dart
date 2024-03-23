import 'package:architecture/app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/core/base/view/base_view.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends BaseView<SignInViewModel> {
  SignInView({super.key});


  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget startView(BuildContext context, ThemeManager theme,
      ConnectivityController connectivity) {
    return Consumer<SignInViewModel>(
        builder: (context, consumer, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: TextFormField(
                        controller: consumer.emailController,
                        decoration:
                            const InputDecoration(hintText: "Kullanıcı Adı"),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: consumer.passwordController,
                        decoration: const InputDecoration(hintText: "Şifre"),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          consumer.signIn(context);
                        },
                        child: const Text("Giriş Yap")),
                    const Spacer(),
                  ],
                ),
              ),
            ));
  }
}

/**
 * class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<SignInViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              child: TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(hintText: "Kullanıcı Adı"),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: viewModel.passwordController,
                decoration: const InputDecoration(hintText: "Şifre"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  viewModel.signIn();
                },
                child: const Text("Giriş Yap")),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

 */