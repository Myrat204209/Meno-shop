import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/search/search.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppSearchBar(),
      actions: [
        AppActionsButton(
          icon: Icons.language,
          onPressed: () => AppBottomSheet.show(
            context: context,
            bottomModalChildren: const LanguageBottomSheetContent(),
          ),
          backgroundColor: AppColors.neutral.shade200,
        ),
        // AppActionsButton(
        //   icon: Icons.notifications_none,
        //   onPressed: () {
        //     context.goNamed(RouteNames.notifications.name);
        //   },
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
