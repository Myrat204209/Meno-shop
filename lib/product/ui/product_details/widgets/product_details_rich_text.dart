import 'package:flutter/material.dart';

class ProductDetailRichText extends StatelessWidget {
  const ProductDetailRichText({
    super.key,
  });
  //TODO: Not enough information
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Offer Ends In:  ',
        children: [
          TextSpan(
            text: '2 days, 12 : 44 : 48',
          ),
        ],
      ),
    );
  }
}
