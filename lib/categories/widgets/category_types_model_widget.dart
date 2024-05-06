import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryModelWidget extends StatelessWidget {
  const CategoryModelWidget({
    super.key,
    required this.color,
    required this.elementColor,
    // required this.onTap,
    this.imagePath = 'assets/friends.jpg',
    required this.label,
  });
  final Color color;
  final Color elementColor;
  final String? imagePath;
  // final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return AppBorderColorBox(
      borderColor: color,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 90,
          maxHeight: 100,
          maxWidth: 90,
          minWidth: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 65,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: UIColors.neutral.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: UITextStyle.subtitle1.copyWith(
                fontSize: 14,
                color: elementColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
