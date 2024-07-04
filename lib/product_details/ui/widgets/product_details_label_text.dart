// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductDetailsLabelText extends StatelessWidget {
  const ProductDetailsLabelText({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
    );
  }
}
