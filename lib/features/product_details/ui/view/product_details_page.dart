// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'package:meno_shop/features/product_details/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.uuid,
  });
  final String uuid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailsAppBar(),
      body: ProductDetailsView(
        uuid: uuid,
      ),
    );
  }
}
