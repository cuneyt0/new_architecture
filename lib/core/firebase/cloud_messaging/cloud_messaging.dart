// ignore_for_file: unused_element

import 'dart:developer';

import 'package:architecture/core/navigation/app_navigation.dart';
import 'package:architecture/core/navigation/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';

final class CloudMessaging {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final CloudMessaging instance = CloudMessaging();
  FlutterTts flutterTts = FlutterTts();

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
      flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings()),
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
          log('onDidReceiveNotificationResponse');
          log('notification(${notificationResponse.id}) action tapped: '
              '${notificationResponse.actionId} with'
              ' payload: ${notificationResponse.payload}');
          await flutterTts.setLanguage("tr-TR");
          await flutterTts.setPitch(1);
          await flutterTts.setSpeechRate(0.5);
          await flutterTts.speak("${notificationResponse.payload}");
          AppNavigation.navigatorKey.currentState?.context
              .go(AppRoutes.notificationView.path);
        },
      );
  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    print('notificationTapBackground');
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
  }

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
              android: setAndroidNotificationDetail(
                icon: android?.smallIcon,
              ),
            ),
            payload: '${notification.title} ${notification.body}',
          );
        }
      },
    );
  }

  AndroidNotificationDetails setAndroidNotificationDetail({
    String? icon,
  }) =>
      AndroidNotificationDetails(
        _androidNotificationChannel.id,
        _androidNotificationChannel.name,
        icon: icon,
        importance: Importance.max,
        actions: [
          AndroidNotificationAction(_androidNotificationChannel.id, "Sesli Oku",
              showsUserInterface: true),
        ],
      );

  // * Uygulama Ölü iken çalışan notification
  Future<void> _terminatedNotification() async =>
      await _messaging.getInitialMessage();
}
