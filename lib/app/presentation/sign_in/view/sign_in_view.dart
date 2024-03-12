import 'package:architecture/app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:architecture/core/getIt/get_it.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
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
