import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:architecture/app/utilities/easy_localization/easy_localization_manager.dart';
import 'package:architecture/core/firebase/analytics/analytics_manager.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/navigation/app_navigation.dart';
import 'package:architecture/core/providers/providers.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await GetStorage.init();
  // MARK: - Hive Init
  await HiveHelper.shared.setupHive();
  // MARK: - GetIt Init
  // MARK: - Localizable Init
  await EasyLocalization.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AnalyticsManager.instance.logAppOpen();
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
      providers: Providers.providers,
      child: Consumer<ThemeManager>(
        builder: (context, consumer, child) {
          return MaterialApp.router(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routerConfig: AppNavigation.router,
            theme: consumer.current.theme,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
