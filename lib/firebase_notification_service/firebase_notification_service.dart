import 'dart:convert';
import 'dart:developer';

import 'package:data_provider/data_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log(message.notification!.title!);
  log(message.notification!.body!);
  log(message.data.toString());
}

const notificationIcon = "launch_background";

class FirebaseNotificationService {
  final FirebaseMessaging _firebaseMessaging;
  final AndroidNotificationChannel _androidNotificationChannel;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  FirebaseNotificationService({
    required FirebaseMessaging firebaseMessaging,
    required AndroidNotificationChannel androidNotificationChannel,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  })  : _firebaseMessaging = firebaseMessaging,
        _androidNotificationChannel = androidNotificationChannel,
        _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    log(message.notification!.title!);
  }

  Future initLocalNotifications() async {
    // const iOS = IOSInitializationSettings();
    const android = AndroidInitializationSettings(notificationIcon);
    const settings = InitializationSettings(
      android: android,
      // iOS: iOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload == null) return;

        final message =
            RemoteMessage.fromMap(jsonDecode(response.payload!) as JsonType);
        handleMessage(message);
      },
    );
    final platform =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidNotificationChannel);
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    await _firebaseMessaging.subscribeToTopic('all');
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) {
        final notification = message.notification;
        final android = message.notification?.android;
        if (notification == null || android == null) return;
        _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidNotificationChannel.id,
              _androidNotificationChannel.name,
              channelDescription: _androidNotificationChannel.description,
              icon: notificationIcon,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      },
    );
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    initPushNotifications();
    initLocalNotifications();
    await _firebaseMessaging.setAutoInitEnabled(true);
  }
}
