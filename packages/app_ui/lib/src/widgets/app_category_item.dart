import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCategoryItem extends StatelessWidget {
  const AppCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBorderColorBox(
      expand: 3,
      borderColor: UIColors.neutral.shade100,
      child: AppBorderColorBox(
        borderColor: UIColors.quaterniary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBorderColorBox(
              borderColor: UIColors.quaterniary,
              child: Image.asset(
                'assets/friends.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Text('Friends'),
          ],
        ),
      ),
    );
  }
}
