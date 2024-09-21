// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:meno_shop/favorites/favorites.dart';

class ProductFavoritesButton extends HookWidget {
  const ProductFavoritesButton({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        useState(context.select((FavoritesBloc bloc) => bloc.isFavorite(uuid)));
    log('-------------------Favorite : $isFavorite -         Productuuid : $uuid');
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) => previous.status == FavoritesStatus.updating,
      builder: (context, state) {
        return Positioned(
          right: 5,
          top: 5,
          child: RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            constraints: const BoxConstraints(maxWidth: 50),
            onPressed: () {
              isFavorite.value = !isFavorite.value;
              context.read<FavoritesBloc>().add(FavoriteButtonPressed(uuid));
            },
            elevation: 3,
            fillColor: AppColors.quaterniary,
            padding: const EdgeInsets.only(top: 2),
            shape: const CircleBorder(),
            child: Icon(
              isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              size: 25,
              color: AppColors.secondary,
            ).paddingAll(3.5),
          ),
        );
      },
    );
  }
}
