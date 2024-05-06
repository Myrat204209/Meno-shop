import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/view/category_types_model_widget.dart';

class HomePageCategoriesList extends StatelessWidget {
  const HomePageCategoriesList({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 55,
          maxHeight: 120,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 10),
          itemCount: images.length,
          itemBuilder: (context, index) {
            final String label = images[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CategoryModelWidget(
                label: label.split('.').first.capitalize().toString(),
                color: UIColors.neutral.shade100,
                elementColor: UIColors.primary,
                // onTap: () {
                //   // TODO:CategoryModelWidget functionality not implemented
                // },
                imagePath: 'assets/${images[index]}',
              ),
            );
          },
        ),
      ),
    );
  }
}
