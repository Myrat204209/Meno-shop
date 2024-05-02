// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgets.dart';
import 'view.dart';

List<String> images = [
  'coat.png',
  'fitness.jpg',
  'friends.jpg',
  'fur.png',
  'hoody.png',
  'i-watch.jpg',
  'jeans.jpg',
  'macbook.jpg',
  'pixel7.png',
  'rolex.png',
];

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
    required this.products,
  });
  final List<AppProductItem> products;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomePageBannerCard(),
        HomePageCategoriesList(images: images),
        HomePageProductsGrid(products: products),

        // HomePageProductsGrid(products: products),
      ],
    );
  }
}

final List<AppProductItem> products = [
  AppProductItem(
    onTap: () {},
    price: 550,
    label: 'Nike wear',
    category: 'Clothes',
    image: 'assets/fur.png',
  ),
  AppProductItem(
    onTap: () {},
    price: 550,
    label: 'Adidas wear',
    category: 'Clothes',
    image: 'assets/jeans.jpg',
  ),
  AppProductItem(
    onTap: () {},
    price: 550,
    label: 'Sweater',
    category: 'Clothes',
    image: 'assets/friends.jpg',
  ),
  AppProductItem(
    onTap: () {},
    price: 550,
    label: 'Hoody',
    category: 'Clothes',
    image: 'assets/hoody.png',
  ),
  AppProductItem(
    onTap: () {},
    price: 550,
    label: 'Hoody',
    category: 'Clothes',
    image: 'assets/hoody.png',
  ),
];
