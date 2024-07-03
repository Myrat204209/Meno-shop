import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
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
    return NavigationBar(
      backgroundColor: AppColors.quaterniary,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 65,
      indicatorColor: Colors.transparent,
      elevation: 4,
      destinations: bottomNavBarList,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
    );
  }
}

const List<BottomNavBarIcon> bottomNavBarList = [
  BottomNavBarIcon(icon: Icons.home_outlined),
  BottomNavBarIcon(icon: Icons.grid_view_outlined),
  BottomNavBarIcon(
      icon: Icons.shopping_bag_outlined, isBadged: true, badgeText: '2'),
  BottomNavBarIcon(icon: Icons.favorite_border_outlined),
  BottomNavBarIcon(icon: Icons.person_outlined),
];
