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
      itemExtent: scrollDirection == Axis.horizontal ? 110 : 140,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CategoryModelWidget(
          label: index.toString(),
          color: UIColors.neutral.shade100,
          elementColor: UIColors.primary,
          imagePath: 'assets/${images[index]}',
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
    required this.imagePath,
    required this.label,
  });
  final Color color;
  final Color elementColor;
  final String imagePath;
  // final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.21,
      child: AspectRatio(
        aspectRatio: 60 / 69,
        child: AppBorderColorBox(
          borderColor: color,
          // expand: 2,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 6 / 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: UIColors.neutral.shade300),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(imagePath.split('.').first.split('/').last),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
