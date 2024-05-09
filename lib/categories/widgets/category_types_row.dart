import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryTypesRow extends StatelessWidget {
  const CategoryTypesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const AppCategoryItem();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
