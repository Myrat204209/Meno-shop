// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationRepository {
  final FirebaseMessaging _firebaseMessaging;

  NotificationRepository({
    required FirebaseMessaging firebaseMessaging,
  }) : _firebaseMessaging = firebaseMessaging {
    _initialize();
  }

  void _initialize() {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      log("Firebase Messaging Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
      log("Message received: ${message.notification?.title}");
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   _handleNavigation(message.data);
    // });
  }
}
