// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const FilterPageWrap(
              label: '',
              children: [],
            ),
            const FilterPageWrap(
              children: categoryChipList,
              label: 'Categories',
            ),
            const FilterPageWrap(children: sizeChipList, label: 'Size'),
            const FilterPageWrap(children: brandChipList, label: 'Brands'),
            const Expanded(child: SizedBox()),
            AppButton(
              type: AppButtonType.large,
              text: 'Close',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
