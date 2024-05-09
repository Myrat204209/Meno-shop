import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/widgets/category_types_model_widget.dart';

class HomePageCategoriesList extends StatelessWidget {
  const HomePageCategoriesList({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppTitledWithViewAllRow(title: 'Select Category'),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 55,
              maxHeight: 120,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CategoryModelWidget(
                    label: index.toString(),
                    color: UIColors.neutral.shade100,
                    elementColor: UIColors.primary,
                    imagePath: 'assets/${images[index]}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
