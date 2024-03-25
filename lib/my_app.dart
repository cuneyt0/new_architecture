import 'package:architecture/core/navigation/app_navigation.dart';
import 'package:architecture/core/providers/providers.dart';
import 'package:architecture/core/theme/core/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
