// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                      image: CachedNetworkImageProvider(imagePath),
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
