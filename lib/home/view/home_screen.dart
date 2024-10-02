// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:meno_shop/navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: navigationShell,
      ),
      bottomNavigationBar: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.neutral.shade300),
          ),
        ),
        child: BottomNavBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (value) => navigationShell.goBranch(
                  value,
                  initialLocation: value == navigationShell.currentIndex,
                )),
      ),
    );
  }
}
