// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/notification/notification.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppSearchBar(),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.quaterniary,
        actions: [
          AppActionsButton(
            icon: Icons.language,
            onPressed: () => showLanguageSelectBottomSheet(context: context),
            backgroundColor: AppColors.neutral.shade200,
          ),
          AppActionsButton(
            icon: Icons.notifications_none,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ));
            },
          ),
        ],
      ),
      backgroundColor: AppColors.quaterniary,
      body: const HomePageContent(),
    );
  }
}
