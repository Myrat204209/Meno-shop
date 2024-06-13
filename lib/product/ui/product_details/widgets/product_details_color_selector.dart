// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsColorSelector extends StatefulWidget {
  const ProductDetailsColorSelector({
    super.key,
    required this.colors,
    required this.checkedColorIndex,
  });
  final int checkedColorIndex;
  final List<Color> colors;

  @override
  State<ProductDetailsColorSelector> createState() =>
      _ProductDetailsColorSelectorState();
}

class _ProductDetailsColorSelectorState
    extends State<ProductDetailsColorSelector> {
  late int checkedIndex;
  @override
  void initState() {
    super.initState();
    checkedIndex = widget.checkedColorIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 40,
        minWidth: 40,
      ),
      child: ListView.builder(
        itemCount: widget.colors.length,
        itemExtent: 50,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              setState(() {
                checkedIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColoredBox(
                color: widget.colors[index],
                child: checkedIndex == index
                    ? const Icon(
                        Icons.check,
                        color: AppColors.quaterniary,
                        size: 18,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
