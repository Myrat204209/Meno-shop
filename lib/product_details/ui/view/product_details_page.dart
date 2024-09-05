// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meno_shop/product_details/product_details.dart';


class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
    required this.uuid,
  });
  final String uuid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppBar(productUuid: uuid),
      body: ProductDetailsView(uuid: uuid),
    );
  }
}
