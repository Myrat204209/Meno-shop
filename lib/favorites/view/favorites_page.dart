// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meno_shop/favorites/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('Favorites'),
        // title: AppSearchBar(hintText: context.l10n.searching),
      ),
      body: const FavoritesContent(),
    );
  }
}
