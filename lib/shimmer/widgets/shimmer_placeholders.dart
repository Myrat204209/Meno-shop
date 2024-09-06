import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BigPlaceholder extends StatelessWidget {
  const BigPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SizedBox(
        width: double.infinity,
        height: 234.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
        ),
      ).paddingSymmetric(horizontal: 15, vertical: 10),
    );
  }
}

class MiddlePlaceholder extends StatelessWidget {
  const MiddlePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const SizedBox(
        width: double.infinity,
        height: 124,
        child: ColoredBox(color: Colors.white),
      ).paddingOnly(top: 15),
    );
  }
}

class SmallPlaceholder extends StatelessWidget {
  const SmallPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const ColoredBox(color: Colors.white)),
      ).paddingOnly(top: 15),
    );
  }
}

class TextPlaceholder extends StatelessWidget {
  const TextPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SizedBox(
        width: double.infinity,
        height: 15,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: const ColoredBox(color: Colors.white)),
      ).paddingOnly(top: 10),
    );
  }
}

class ProductsPlaceholder extends StatelessWidget {
  const ProductsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              width: double.infinity,
              height: 16.0,
              color: Colors.white,
            ),
          ).paddingSymmetric(vertical: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 96.0,
                  height: 281,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Container(
                  width: 96.0,
                  height: 281,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 10).paddingOnly(bottom: 20),
    );
  }
}
