import 'dart:developer';

import 'package:architecture/app/utilities/cache/cache_manager.dart';
import 'package:architecture/app/utilities/easy_localization/easy_localization_manager.dart';
import 'package:architecture/core/firebase/analytics/analytics_manager.dart';
import 'package:architecture/core/firebase/cloud_messaging/cloud_messaging.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/firebase_options.dart';
import 'package:architecture/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/environments/.env.production");
  // MARK: - GetIt Init
  configureDependencies();

  await GetStorage.init();
  // MARK: - Hive Init
  await HiveHelper.shared.setupHive();

  // MARK: - Localizable Init
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Firebase Messaging initialize
  await CloudMessaging.instance.initialize();

  // * FİREBASE ARKA PLANDA BİLDİRİMLER DİNLER
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await AnalyticsManager.instance.logAppOpen();
  runApp(
    EasyLocalization(
      path: EasyLocalizationManager.path,
      supportedLocales: EasyLocalizationManager.supportedLocales,
      child: const MyApp(),
    ),
  );
}

// FİREBASE ARKA PLANDA BİLDİRİMLER DİNLER
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    log("background messaging ${message.notification}");
  }
}
