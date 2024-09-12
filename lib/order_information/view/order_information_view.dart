// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        title: Text(context.l10n.orderInformation),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Divider(
              color: AppColors.primary,
              thickness: 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_downward),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.totalPrice),
                    const Text('3678 TMT'),
                  ],
                ),
                const Expanded(child: SizedBox()),
                AppButton(
                  buttonText: 'Buy Again',
                  onTap: () {},
                  textColor: AppColors.quaterniary,
                  color: AppColors.secondary,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.cart,
  });
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state.status == ProductDetailsStatus.loading) {
          return const MiddlePlaceholder();
        }
        if (state.status == ProductDetailsStatus.populated) {
          final product = state.product;
          return SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  imageUrl: product!.photo?.first.path!.fullPath(),
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
                        "${product.name?.changeLocale(context.l10n.localeName)}",
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
                ).paddingSymmetric(horizontal: 8),
                const Expanded(child: SizedBox()),
                CartCounter(
                  addOneButton: () {
                    context.read<CartBloc>().add(CartItemQuantityUpdated(
                          productId: cart.uuid,
                          quantity: cart.quantity + 1,
                        ));
                  },
                  removeOneButton: () {
                    context.read<CartBloc>().add(CartItemQuantityUpdated(
                          productId: cart.uuid,
                          quantity: cart.quantity - 1,
                        ));
                  },
                  counterQuantity: cart.quantity,
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    ).paddingSymmetric(horizontal: 10);
  }
}

class CartCounter extends HookWidget {
  const CartCounter({
    super.key,
    required this.addOneButton,
    required this.removeOneButton,
    required this.counterQuantity,
  });
  final VoidCallback addOneButton;
  final VoidCallback removeOneButton;
  final int counterQuantity;
  @override
  Widget build(BuildContext context) {
    final quantity = useState(counterQuantity);
    return AppWrapper(
      borderColor: AppColors.neutral.shade300,
      expand: 1,
      child: SizedBox(
        width: 118,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                removeOneButton.call();
                if (quantity.value > 0) {
                  quantity.value--;
                }
              },
              icon: const Icon(
                Icons.remove,
                size: 25,
                color: AppColors.primary,
              ),
            ),
            Text(
              '${quantity.value}',
              style: const AppTextStyle.text().md().semiBold(),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                addOneButton.call();

                quantity.value++;
              },
              icon: const Icon(
                Icons.add,
                size: 25,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
