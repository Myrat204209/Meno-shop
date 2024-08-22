import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/features/categories/categories.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.select(
      (CategoriesBloc bloc) => bloc.state.categories,
    );
    return CategoriesContent(
      categories: categories,
    );
  }
}
