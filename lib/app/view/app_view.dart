import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/navigation/navigation.dart';
import 'package:meno_shop/profile/profile.dart';

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
        statusBarColor: UIColors.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '.shop',
      theme: ThemeData(
        scaffoldBackgroundColor: UIColors.quaterniary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: UIColors.secondary,
        ),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: [
            HomePageContent(products: products),
            const CategoriesPage(),
            const CartPage(),
            const FavoritesPage(),
            const ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: selectedTab,
          onTap: (value) => context.read<HomeCubit>().setTab(value),
        ),
      ),
    );
  }
}