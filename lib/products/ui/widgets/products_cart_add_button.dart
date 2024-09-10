// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/cart/cart.dart';

class ProductCartAddButton extends StatelessWidget {
  const ProductCartAddButton({
    super.key,
    required this.productUuid,
    required this.creatorUuid,
  });

  final String productUuid;
  final String? creatorUuid;

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      onTap: () {
        final cartItem = CartItem(
          uuid: productUuid,
          quantity: 1,
          size: '',
          creator: creatorUuid ?? '',
        );
        context.read<CartBloc>().add(CartItemAdded(cartItem: cartItem));
      },
      color: AppColors.secondary,
    ).paddingOnly(left: 7);
  }
}
