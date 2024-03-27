// ignore_for_file: unused_element

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class CloudMessaging {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final CloudMessaging instance = CloudMessaging();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _initializeLocalNotification();
    await _permissionFirebaseNotification();
    await _getNotificationToken();
    await _listenToForegroundMessages();
    await _terminatedNotification();
  }

// IOS ortamında uygulama kullanılırken bildirimin gelmesini saglayan fonksiyon
  Future<void> _setForegroundNotificationShowOption() async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  //*Local Notification init.
  Future<void> _initializeLocalNotification() async =>
      flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()));

  //Uygulama androidde foreground da bildirimin gelmesi için gerekli config. ayarı
  final AndroidNotificationChannel _androidNotificationChannel =
      const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  Future<void> _createNotificationChannelAndroid() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidNotificationChannel);

  //Firebase Bildirimlerinin izni için gerekli olan fonksiyon
  Future<void> _permissionFirebaseNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');
  }

  //Device Token
  Future<String?> _getNotificationToken() async {
    final token = await _messaging.getToken();
    log('Firebase Token: $token');
    return token;
  }

  //Foreground Mesajları dinler
  Future<void> _listenToForegroundMessages() async {
    FirebaseMessaging.onMessage.listen(
      (message) async {
        final notification = message.notification;
        final android = message.notification?.android;

        if (message.notification != null) {
          await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: setAndroidNotificationDetail(icon: android?.smallIcon),
            ),
          );
        }
      },
    );
  }

  AndroidNotificationDetails setAndroidNotificationDetail({String? icon}) =>
      AndroidNotificationDetails(
        _androidNotificationChannel.id,
        _androidNotificationChannel.name,
        icon: icon,
      );
  // * Uygulama Ölü iken çalışan notification
  Future<void> _terminatedNotification() async =>
      await _messaging.getInitialMessage();
}
