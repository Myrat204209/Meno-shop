import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meno_shop/firebase_notification_service/firebase_notification_service.dart';
import 'package:meno_shop/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:meno_shop/main/bootstrap/app_bloc_observer.dart';

typedef AppBuilder = Future<Widget> Function({
  required FirebaseMessaging firebaseMessaging,
  required SharedPreferences sharedPreferences,
  required StreamController<Exception> exceptionStream,
});

Future<void> bootStrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      /// Initialize date formatting
      await initializeDateFormatting();

      StreamController<Exception> exceptionStream = StreamController();

      final firebaseMessaging = FirebaseMessaging.instance;
      late final String? firebaseToken;
      try {
        // firebaseToken = await firebaseMessaging.getToken();
        // log('-------------------${firebaseToken!}');
      } catch (error, stackTrace) {
        log('-------------------FirebaseMessaging error: $error$stackTrace');
      }
      const androidNotificationChannel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.high,
      );
      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // FirebaseNotificationService(
      //   androidNotificationChannel: androidNotificationChannel,
      //   firebaseMessaging: firebaseMessaging,
      //   flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      // ).initNotifications();

      final blocObserver = AppBlocObserver(
        exceptionStream: exceptionStream,
      );
      Bloc.observer = blocObserver;

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationSupportDirectory(),
      );

      /// Hive Box
      await Hive.initFlutter();

      final sharedPreferences = await SharedPreferences.getInstance();

      runApp(
        await builder(
          firebaseMessaging: firebaseMessaging,
          sharedPreferences: sharedPreferences,
          exceptionStream: exceptionStream,
        ),
      );
    },
    (exception, stackTrace) async {},
  );
}
