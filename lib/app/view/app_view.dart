import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/features/l10n/l10n.dart';
import 'package:meno_shop/features/language/bloc/language_bloc.dart';
import 'package:turkmen_localization_support/turkmen_localization_support.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xFFE2EAFF),
        //  Color(0xA8E2EAFF),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = AppNavigation.router;
    return BlocBuilder<LanguageBloc, Locale>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp.router(
          locale: state,
          debugShowCheckedModeBanner: false,
          theme: const AppTheme().themeData,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...TkDelegates.delegates,
          ],
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}
