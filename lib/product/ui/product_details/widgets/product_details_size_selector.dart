// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsSizeSelector extends StatefulWidget {
  const ProductDetailsSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
  });
  final List<String> sizes;
  final String selectedSize;

  @override
  State<ProductDetailsSizeSelector> createState() =>
      _ProductDetailsSizeSelectorState();
}

class _ProductDetailsSizeSelectorState
    extends State<ProductDetailsSizeSelector> {
  late String selectedSize;
  late List<String> sizes;
  @override
  void initState() {
    super.initState();
    sizes = widget.sizes;
    selectedSize = widget.selectedSize;
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.sizes.length;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: UIColors.neutral.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 35,
          maxHeight: 50,
          minWidth: 50,
        ),
        child: SizedBox(
          width: (31 * (length * 2 - 1)),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            itemCount: length * 2 - 1,
            itemExtent: 30,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 0),
              child: index % 2 == 1
                  ? index != length - 1
                      ? const DotIcon()
                      : null
                  : InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        log(index.toString());
                        setState(() {
                          selectedSize = sizes[index ~/ 2];
                        });
                      },
                      child: selectedSize != sizes[index ~/ 2]
                          ? Center(
                              child: Text(
                                widget.sizes[index ~/ 2],
                                style: UITextStyle.subtitle2.copyWith(
                                  color: UIColors.neutral.shade500,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  selectedSize,
                                  style: UITextStyle.headline5.copyWith(
                                    color: UIColors.secondary,
                                    fontSize: 17,
                                  ),
                                ),
                                const SelectedLineIndicator()
                              ],
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedLineIndicator extends StatelessWidget {
  const SelectedLineIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      child: SizedBox(
        height: 2,
        width: 36,
        child: ColoredBox(
          color: UIColors.secondary,
        ),
      ),
    );
  }
}

class DotIcon extends StatelessWidget {
  const DotIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: UIColors.neutral.shade500,
      size: 8,
    );
  }
}
