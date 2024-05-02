import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart.dart';
import '../../categories/category.dart';
import '../../home/home.dart';
import '../../navigation/navigation.dart';
import '../../profile/profile.dart';
import '../../home/cubit/home_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tabIndex);
    return Scaffold(
      backgroundColor: UIColors.quaterniary,
      body: IndexedStack(
        index: selectedTab,
        children: const [
          HomePage(),
          CategoryTypesPage(),
          CartPage(),
          //TODO: MainPage: Favotites Page missing!!!
          Center(child: Text('Favorites')),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedTab,
        onTap: (index) {
          context.read<HomeCubit>().setTab(index);
        },
      ),
    );
  }
}
