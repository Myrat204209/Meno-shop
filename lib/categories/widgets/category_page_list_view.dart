// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCategoryListView extends StatelessWidget {
  const AppCategoryListView({
    super.key,
    required this.images,
    required this.scrollDirection,
  });

  final List<String> images;
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: images.length,
      itemExtent: 150,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: CategoryModelWidget(
            label: index.toString(),
            color: UIColors.neutral.shade100,
            elementColor: UIColors.primary,
            imagePath: 'assets/${images[index]}',
          ),
        );
      },
    );
  }
}

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
      expand: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: SizedBox(
                width: 80,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: UIColors.neutral.shade300),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: UITextStyle.subtitle1.copyWith(
                fontSize: 13,
                color: elementColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
