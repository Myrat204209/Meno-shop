import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({
    super.key,
    required this.productUuid,
  });
  final String productUuid;
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.select((FavoritesBloc bloc) => bloc.isFavorite(productUuid));
    return AppBar(
      title:  Text(context.l10n.productDetails),
      scrolledUnderElevation: 0,
      centerTitle: true,
      actions: [
        AppActionsButton(
          onPressed: () {
            context
                .read<FavoritesBloc>()
                .add(FavoriteButtonPressed(productUuid));
          },
          icon: isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          backgroundColor: AppColors.quaterniary,
          iconColor:
              isFavorite ? AppColors.secondary : AppColors.neutral.shade500,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
