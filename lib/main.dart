import 'package:architecture/app/presentation/splash/viewmodel/splash_viewmodel.dart';
import 'package:architecture/app/presentation/users/view/users_view.dart';
import 'package:architecture/app/presentation/users/viewmodel/users_viewmodel.dart';
import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/app/utilities/easy_localization/easy_localization_manager.dart';
import 'package:architecture/core/getIt/get_it.dart';
import 'package:architecture/core/navigation/navigation.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // MARK: - Hive Init
  await HiveHelper.shared.setupHive();
  // MARK: - GetIt Init
  setupGetIT();
  // MARK: - Localizable Init
  await EasyLocalization.ensureInitialized();

  getIt.get<ConnectivityController>().firstCheck();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      path: EasyLocalizationManager.path,
      supportedLocales: EasyLocalizationManager.supportedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectivityController>(
            create: (BuildContext context) =>
                getIt.get<ConnectivityController>()),
        ChangeNotifierProvider<UsersViewModel>(
          create: (BuildContext context) => getIt.get<UsersViewModel>(),
        ),
        ChangeNotifierProvider<SplashViewModel>(
          create: (BuildContext context) => getIt.get<SplashViewModel>(),
        ),
        ChangeNotifierProvider<ThemeManager>(
            create: (BuildContext context) => ThemeManager()),
      ],
      child: Consumer<ThemeManager>(builder: (context, consumer, child) {
        return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            navigatorKey: Navigation.navigatorKey,
            theme: consumer.current.theme,
            home: UsersView());
      }),
    );
  }
}
