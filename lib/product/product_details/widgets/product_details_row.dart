// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:meno_shop/product/product_details/product_details.dart';

class ProductDetailsRow extends StatelessWidget {
  const ProductDetailsRow({
    super.key,
    required this.onSalePercent,
  });
  final double onSalePercent;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBorderColorBox(
          borderColor: UIColors.starsColor,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 35,
              minHeight: 35,
              maxHeight: 50,
              maxWidth: 50,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 3,
                ),
                child: Text(
                  '-${onSalePercent.toInt()}%',
                  style: UITextStyle.headline5.copyWith(
                    fontSize: 15,
                    color: UIColors.quaterniary,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Gap(15),
        const AppTwoLayeredTextWidget(),
        const Spacer(flex: 1),
        const ProductDetailsUnderlinedText(),
        const MaxGap(5),
      ],
    );
  }
}
