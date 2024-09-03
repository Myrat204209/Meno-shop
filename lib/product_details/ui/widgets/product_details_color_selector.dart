import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets.dart';

class ProductDetailsColorSelector extends HookWidget {
  const ProductDetailsColorSelector({
    super.key,
    required this.colors,
    required this.checkedColorIndex,
  });

  final int checkedColorIndex;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    // Use useState to manage the checked index state
    final checkedIndex = useState(checkedColorIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose color',
          style: kAppTitleTextStyle,
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 40,
            minWidth: 40,
          ),
          child: ListView.builder(
            itemCount: colors.length,
            itemExtent: 50,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  checkedIndex.value = index;
                },
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ColoredBox(
                    color: colors[index],
                    child: checkedIndex.value == index
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
        ),
      ],
    );
  }
}
