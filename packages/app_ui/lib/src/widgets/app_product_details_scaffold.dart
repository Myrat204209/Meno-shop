// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppProductDetailsScaffold extends StatelessWidget {
  const AppProductDetailsScaffold({
    super.key,
    required this.header,
    required this.offerInfoView,
    required this.saleInfoView,
    required this.reviewListView,
    required this.descriptionView,
    required this.sizeInfoView,
    required this.colorInfoView,
    required this.similarsGridView,
    required this.commentsListView,
    required this.assestmentButton,
    required this.quantityInfoView,
    required this.addToCartButton,
  });
  final Widget header;
  final Widget offerInfoView;
  final Widget saleInfoView;
  final Widget reviewListView;
  final Widget descriptionView;
  final Widget sizeInfoView;
  final Widget colorInfoView;
  final Widget similarsGridView;
  final Widget commentsListView;
  final Widget assestmentButton;
  final Widget quantityInfoView;
  final Widget addToCartButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                header,
                offerInfoView,
                saleInfoView,
                reviewListView,
                descriptionView,
                colorInfoView,
                sizeInfoView,
                similarsGridView,
                commentsListView,
               ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                quantityInfoView,
                addToCartButton,
              ],
            ),
          )
        ],
      ),
    );
  }
}
