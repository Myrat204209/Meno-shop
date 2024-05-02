import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryTypesRow extends StatelessWidget {
  const CategoryTypesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      prototypeItem: const AppCategoryItem(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: AppCategoryItem(),
        );
      },
    );
  }
}
