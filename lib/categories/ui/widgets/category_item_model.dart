// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryModelWidget extends StatelessWidget {
  const CategoryModelWidget({
    super.key,
    required this.color,
    required this.elementColor,
    // required this.onTap,
    required this.imageLink,
    required this.label,
  });
  final Color color;
  final Color elementColor;
  final String imageLink;
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
                child: AppImage(
                  imageUrl: imageLink,
                  imageType: ImageType.cached,
                ),
              ),
              Expanded(child: Text(label)),
            ],
          ),
        ),
      ),
    );
  }
}
