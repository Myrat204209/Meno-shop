// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/cart/cart.dart';

class ProductDetailsCartCounter extends StatelessWidget {
  const ProductDetailsCartCounter({
    super.key,
    required this.addOneButton,
    required this.removeOneButton,
  });
  final VoidCallback addOneButton;
  final VoidCallback removeOneButton;
  @override
  Widget build(BuildContext context) {
    final cartQuantity =
        context.select((CartBloc bloc) => bloc.state.currentItem?.quantity);
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductCounterIcon(onCallBack: removeOneButton),
            Text(
              '$cartQuantity',
              style: const AppTextStyle.text().lg().semiBold(),
            ),
            ProductCounterIcon(onCallBack: addOneButton,isAdd: true),
          ],
        ),
      ),
    );
  }
}

class ProductCounterIcon extends StatelessWidget {
  const ProductCounterIcon({
    super.key,
    required this.onCallBack,
    this.isAdd = false,
  });

  final VoidCallback onCallBack;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onCallBack(),
      icon: Icon(
        isAdd ? Icons.add : Icons.remove,
        size: 30,
        color: AppColors.primary,
      ),
    );
  }
}
