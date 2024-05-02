import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
      destinations: const [
        NavigationDestination(
          icon: Icon(
            Icons.home_outlined,
            color: UIColors.secondary,
            size: 32,
          ),
          label: 'Home',
          selectedIcon: Icon(
            Icons.home,
            color: UIColors.secondary,
            size: 32,
          ),
        ),
        NavigationDestination(
          icon: Icon(
            Icons.grid_view_outlined,
            color: UIColors.secondary,
            size: 32,
          ),
          selectedIcon: Icon(
            Icons.grid_view_rounded,
            color: UIColors.secondary,
            size: 32,
          ),
          label: 'Category',
        ),
        NavigationDestination(
          icon: Badge(
            backgroundColor: UIColors.secondary,
            offset: Offset(8, -1),
            label: Text('2'),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: UIColors.secondary,
              size: 32,
            ),
          ),
          selectedIcon: Badge(
            backgroundColor: UIColors.secondary,
            offset: Offset(8, -1),
            label: Text('2'),
            child: Icon(
              Icons.shopping_bag,
              color: UIColors.secondary,
              size: 32,
            ),
          ),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.favorite_border_outlined,
            size: 32,
            color: UIColors.secondary,
          ),
          label: 'Favorite',
          selectedIcon: Icon(
            Icons.favorite,
            size: 32,
            color: UIColors.secondary,
          ),
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person_outlined,
            color: UIColors.secondary,
            size: 32,
          ),
          selectedIcon: Icon(
            Icons.person,
            size: 32,
            color: UIColors.secondary,
          ),
          label: 'Profile',
        ),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
    );
  }
}
