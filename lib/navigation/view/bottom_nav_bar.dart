import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/navigation/navigation.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueSetter<int> onTap;
  @override
  Widget build(BuildContext context) {
    final cartLength =
        context.select((CartBloc bloc) => bloc.state.cart.length);

    return NavigationBar(
      backgroundColor: AppColors.quaterniary,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 65,
      indicatorColor: AppColors.transparent,
      elevation: 5,
      destinations: _buildBottomNavBarList(badgeNumber: cartLength),
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
    );
  }
}

List<BottomNavBarIcon> _buildBottomNavBarList({int badgeNumber = 0}) {
  log('\x1B[32m---------bottomNavBartlist changeed---- $badgeNumber------');
  return [
    const BottomNavBarIcon(icon: Icons.home_outlined),
    const BottomNavBarIcon(icon: Icons.grid_view_outlined),
    BottomNavBarIcon(
      icon: Icons.shopping_bag_outlined,
      isBadged: badgeNumber != 0,
      badgeText: badgeNumber == 0 ? '' : badgeNumber.toString(),
    ),
    const BottomNavBarIcon(icon: Icons.favorite_border_outlined),
    const BottomNavBarIcon(icon: Icons.person_outlined),
  ];
}
