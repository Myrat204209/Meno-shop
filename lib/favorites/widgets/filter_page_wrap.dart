import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart' show FilterPageChip;

class FilterPageWrap extends StatelessWidget {
  const FilterPageWrap({
    super.key,
    this.children,
    required this.label,
  });
  final List<String?>? children;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitledWithViewAllRow(title: label),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: children == null
              ? []
              : children!
                  .map((element) => FilterPageChip(
                        isSelected: false,
                        label: element,
                      ))
                  .toList(),
        ),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}
