// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductDetailsDescriptionText extends StatelessWidget {
  const ProductDetailsDescriptionText({
    super.key,
    required this.descriptionText,
  });
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return const Text(
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.sadbj 
      Morbi non erat quam.Vestibulum aliquam nibh dui, et aliquet nibh euismod quis.''',
    );
  }
}
