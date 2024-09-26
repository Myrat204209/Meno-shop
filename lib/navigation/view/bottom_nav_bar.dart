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
    return BlocBuilder<CartBloc, CartState>(
      // listener: (context, state) {
      //   if (state.status == CartStatus.loadingSuccess) {}
      // },
      buildWhen: (previous, current) {
        log('\x1B[31m-----------cart size uytgedii-----${current.cart.length}         bu-da \x1B[34m${current.cart}');
        return current.cart.length != previous.cart.length;
      },
      builder: (context, state) {
        final String badgeText =
            state.cart.isNotEmpty ? state.cart.length.toString() : '';
        return NavigationBar(
          backgroundColor: AppColors.quaterniary,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 65,
          indicatorColor: AppColors.transparent,
          elevation: 5,
          destinations: _buildBottomNavBarList(badgeText),
          selectedIndex: currentIndex,
          onDestinationSelected: onTap,
        );
      },
    );
  }
}

List<BottomNavBarIcon> _buildBottomNavBarList(String badgeText) {
  log('\x1B[32m------------bottomNavBartlisst changeeedd---- $badgeText------');
  return [
    const BottomNavBarIcon(icon: Icons.home_outlined),
    const BottomNavBarIcon(icon: Icons.grid_view_outlined),
    BottomNavBarIcon(
      icon: Icons.shopping_bag_outlined,
      isBadged: badgeText.isNotEmpty,
      badgeText: badgeText,
    ),
    const BottomNavBarIcon(icon: Icons.favorite_border_outlined),
    const BottomNavBarIcon(icon: Icons.person_outlined),
  ];
}
