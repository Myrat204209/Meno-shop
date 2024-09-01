import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
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
          options: DefaultFirebaseOptions.currentPlatform);

      /// Initialize date formatting
      await initializeDateFormatting();

      StreamController<Exception> exceptionStream = StreamController();

      final firebaseMessaging = FirebaseMessaging.instance;
      await firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      await firebaseMessaging.setAutoInitEnabled(true);
      // Lisitnening to the background messages
      // Future<void> firebaseMessagingBackgroundHandler(
      //   RemoteMessage message,
      // ) async {
      //   await Firebase.initializeApp(
      //       options: DefaultFirebaseOptions.currentPlatform);
      //   log("Handling a background message: ${message.messageId}");
      // }

      // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
