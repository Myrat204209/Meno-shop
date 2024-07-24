import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/language/bloc/language_bloc.dart';
import 'package:meno_shop/navigation/navigation.dart';
import 'package:meno_shop/profile/profile.dart';
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
    final selectedTab = context.select(
      (AppCubit cubit) => cubit.state.tabIndex,
    );
    debugPrint('--------AppView.build');
    log('--------AppCubit.state.tabIndex: $selectedTab');
    return BlocBuilder<LanguageBloc, Locale>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp(
          locale: state,
          debugShowCheckedModeBanner: false,
          theme: const AppTheme().themeData,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...TkDelegates.delegates,
          ],
          home: SafeArea(
            child: Scaffold(
              body: IndexedStack(
                index: selectedTab,
                children: const [
                  HomePage(),
                  CategoriesPage(),
                  CartPage(),
                  FavoritesPage(),
                  ProfilePage(),
                ],
              ),
              bottomNavigationBar: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.neutral.shade300,
                    ),
                  ),
                ),
                child: BottomNavBar(
                  currentIndex: selectedTab,
                  onTap: (value) => context.read<AppCubit>().setTab(value),
                ),
              ).paddingOnly(top: 5),
            ),
          ),
        );
      },
    );
  }
}
