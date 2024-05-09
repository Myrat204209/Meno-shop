// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/authentication/authentication.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/connectivity/connectivity.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/navigation/navigation.dart';
import 'package:meno_shop/profile/profile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {},
        ),
      ],
      child: Scaffold(
        backgroundColor: UIColors.quaterniary,
        appBar: const HomePageAppBar(),
        body: IndexedStack(
          index: selectedTab,
          children: [
            HomePageContent(
              products: products,
            ),
            const CategoryTypesPage(),
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
