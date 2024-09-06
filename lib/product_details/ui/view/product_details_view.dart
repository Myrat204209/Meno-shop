// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:meno_shop/product_details/product_details.dart'
    show ProductDetailsContent;

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    // final cartBloc = context.read<CartBloc>();

    return const Column(
      children: [
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: ProductDetailsContent(),
          ),
        ),
        // BlocBuilder<CartBloc, CartState>(
        //   builder: (context, state) {
        //     final quantity = cartBloc.showQuantity(product.uuid!);
        //     return Column(
        //       children: [
        //         Divider(color: AppColors.neutral.shade300),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             ProductDetailsCartCounter(
        //               counterQuantity: quantity,
        //               addOneButton: () {
        //                 cartBloc.add(CartItemAdded(CartItem(
        //                   uuid: product.uuid!,
        //                   productName: product.name!.changeLocale(locale),
        //                   quantity: quantity,
        //                   price: product.price!,
        //                 )));
        //               },
        //               removeOneButton: () {
        //                 cartBloc.add(CartItemRemoved(CartItem(
        //                   uuid: product.uuid!,
        //                   productName: product.name!.changeLocale(locale),
        //                   quantity: quantity,
        //                   price: product.price!,
        //                 )));
        //               },
        //             ),
        //             AppButton.standard(
        //               buttonText: 'Add to Cart',
        //               onTap: cartBloc.isCartAdded(product.uuid!)
        //                   ? null
        //                   : () {
        //                       cartBloc.add(CartItemAdded(CartItem(
        //                         uuid: product.uuid!,
        //                         productName: product.name!.changeLocale(locale),
        //                         quantity: 1,
        //                         price: product.price!,
        //                       )));
        //                     },
        //               icon: const Icon(
        //                 Icons.shopping_bag_outlined,
        //                 color: AppColors.quaterniary,
        //               ),
        //             )
        //           ],
        //         ).paddingSymmetric(vertical: 5),
        //       ],
        //     );
        //   },
        // )
      ],
    );
  }
}
