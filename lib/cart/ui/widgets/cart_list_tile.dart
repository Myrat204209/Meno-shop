// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cart,
  });
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    final cartQuantity =
        context.select((CartBloc bloc) => bloc.showQuantity(cart.uuid));
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            imageUrl: cart.photoPath.fullPath(),
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ).clipper(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                child: Text(
                  context.l10n.localeName == 'tk' ? cart.nameTk : cart.nameRu,
                  overflow: TextOverflow.ellipsis,
                  style: const AppTextStyle.text().md().medium(),
                ),
              ),
              if (cart.size != '')
                Text(
                  'Size: ${cart.size} ',
                  style: const AppTextStyle.text()
                      .xs()
                      .regular()
                      .withColor(AppColors.neutral.shade700),
                ),
              const SizedBox(height: 10),
              Text(
                '${cart.price} TMT',
                style: const AppTextStyle.text().lg().semiBold(),
              ),
            ],
          ).paddingSymmetric(horizontal: 7),
          const Expanded(child: SizedBox.shrink()),
          CartCounter(
            addOneButton: () {
              context
                ..read<CartBloc>().add(CartCurrentItemCreated(uuid: cart.uuid))
                ..read<CartBloc>()
                    .add(const CartItemOneUpdated(isForAdding: true));
            },
            removeOneButton: () {
              context
                ..read<CartBloc>().add(CartCurrentItemCreated(uuid: cart.uuid))
                ..read<CartBloc>()
                    .add(const CartItemOneUpdated(isForAdding: false));
            },
            counterQuantity: cartQuantity,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 8);
  }
}
