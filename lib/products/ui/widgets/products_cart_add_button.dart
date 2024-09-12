// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/cart/cart.dart';

class ProductCartAddButton extends StatelessWidget {
  const ProductCartAddButton({
    super.key,
    required this.productUuid,
  });

  final String productUuid;

  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      onTap: () {
        context.read<CartBloc>().add(CartItemAdded(productUuid: productUuid));
      },
      color: AppColors.secondary,
    ).paddingOnly(left: 7);
  }
}
