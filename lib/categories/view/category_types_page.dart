// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/view/category_types_model_widget.dart';
import 'package:meno_shop/categories/view/category_types_row.dart';

import '../widgets/widgets.dart';

class CategoryTypesPage extends StatefulWidget {
  const CategoryTypesPage({super.key});

  @override
  State<CategoryTypesPage> createState() => _CategoryTypesPageState();
}

class _CategoryTypesPageState extends State<CategoryTypesPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppSearchField(),
        actions: [
          CategoryActionButton(
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 100,
              ),
              child: const CategoryTypesRow(),
            ),
            SizedBox(
              width: 224,
              height: 800,
              child: GridView.builder(
                itemCount: selectedIndex,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 90,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryModelWidget(
                    label: 'For women T-Shirt',
                    elementColor: UIColors.primary,
                    color: UIColors.neutral.shade100,
                    // onTap: () {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const CategoryPage(),
                    //     ),
                    //   );
                    // },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
