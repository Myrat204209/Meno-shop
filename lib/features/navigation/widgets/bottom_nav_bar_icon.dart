// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// BottomNavBarIcon class
class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    this.isBadged = false,
    this.badgeText = '',
    required this.icon,
  });
  final bool isBadged;
  final String badgeText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: !isBadged
          ? NavIcon(icon: icon)
          : BottomNavBarBadge(
              icon: icon,
              badgeText: badgeText,
            ),
      selectedIcon: !isBadged
          ? NavIcon(icon: icon, isSelected: true)
          : BottomNavBarBadge(
              icon: icon,
              badgeText: badgeText,
              isSelected: true,
            ),
      label: '',
    );
  }
}

class BottomNavBarBadge extends StatelessWidget {
  const BottomNavBarBadge({
    super.key,
    required this.icon,
    this.isSelected = false,
    required this.badgeText,
  });
  final String badgeText;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: AppColors.secondary,
      offset: const Offset(4, -1),
      label: Text(
        badgeText,
      ),
      largeSize: 18,
      child: NavIcon(
        icon: icon,
        isSelected: isSelected,
      ),
    );
  }
}

/// Map for the navigationIcons
/// 'key' is icon which is not selected,
/// 'value' is icon which is selected
final Map<IconData, IconData> navigationIcons = {
  Icons.home_outlined: Icons.home,
  Icons.grid_view_outlined: Icons.grid_view_rounded,
  Icons.shopping_bag_outlined: Icons.shopping_bag,
  Icons.favorite_border_outlined: Icons.favorite,
  Icons.person_outlined: Icons.person,
};

/// Custom NavigationIcon with prespecified parameters
class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    this.isSelected = false,
    required this.icon,
  });

  /// The boolean indicator to check whether the icon is selected ir not
  final bool isSelected;

  /// The icon to be displayed
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isSelected ? navigationIcons[icon] : icon,
      color: isSelected ? AppColors.secondary : AppColors.neutral.shade700,
      size: 28,
    );
  }
}
