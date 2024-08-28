// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/constants/constants.dart';

import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({
    super.key,
    required this.category,
    // required this.subcategory,
  });

  final CategoryItem category;
  // final SubcategoryItem subcategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${category.name}/subcategory.name'),
        Text(
          'Filter search value',
          style: const AppTextStyle.text()
              .lg()
              .bold()
              .withColor(AppColors.primary),
        ),
        const SizedBox(height: AppSpacing.xlg),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 160 / 285,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            padding: EdgeInsets.zero,
            children: [
              AppProductItem(
                onTap: () {},
                onFavoriteAdded: () {
                  context
                      .read<FavoritesBloc>()
                      .add(const FavoriteButtonPressed(ProductItem()));
                },
                product: const ProductItem(),
                //TODO: Functional emission
                imageLink: 
                '$kDefaultBaseUrl/null',
                onCartAdded: () {},
                locale: context.l10n.localeName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
