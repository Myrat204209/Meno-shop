import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meno_shop/main/bootstrap/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AppBuilder = Future<Widget> Function(
  SharedPreferences sharedPreferences,
  StreamController<Exception> exceptionStream,
);

Future<void> bootStrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize date formatting
      await initializeDateFormatting();

      StreamController<Exception> exceptionStream = StreamController();

      final blocObserver = AppBlocObserver(
        exceptionStream: exceptionStream,
      );
      Bloc.observer = blocObserver;

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationSupportDirectory(),
      );

      final sharedPreferences = await SharedPreferences.getInstance();

      runApp(
        await builder(
          sharedPreferences,
          exceptionStream,
        ),
      );
    },
    (exception, stackTrace) async {},
  );
}
