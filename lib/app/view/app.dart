// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/bloc/favorites_bloc.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/orders/data/data.dart';
import 'package:meno_shop/product_details/product_details.dart';
import 'package:meno_shop/products/products.dart';
import 'package:meno_shop/subcategories/subcategories.dart';

/// The main application widget that initializes and provides necessary repositories and blocs to the app.
///
/// This widget is responsible for setting up the initial state of the application, including
/// repositories for fetching data and blocs for managing application state.
class App extends StatelessWidget {
  const App({
    super.key,
    required StreamController<Exception> exceptionStream,
    required BannerRepository bannerRepository,
    required CategoryRepository categoryRepository,
    required SubcategoryRepository subcategoryRepository,
    required ProductRepository productRepository,
    required AddressRepository addressRepository,
    required AuthRepository authRepository,
    required CartRepository cartRepository,
    required OrderRepository orderRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _bannerRepository = bannerRepository,
        _addressRepository = addressRepository,
        _cartRepository = cartRepository,
        _orderRepository = orderRepository,
        _authRepository = authRepository,
        _subcategoryRepository = subcategoryRepository;

  final CategoryRepository _categoryRepository;
  final SubcategoryRepository _subcategoryRepository;
  final ProductRepository _productRepository;
  final BannerRepository _bannerRepository;
  final AddressRepository _addressRepository;
  final AuthRepository _authRepository;
  final CartRepository _cartRepository;
  final OrderRepository _orderRepository;
  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc(authRepository: _authRepository);
    final languageBloc = LanguageBloc();
    final homeBloc = HomeBloc(
      subcategoryRepository: _subcategoryRepository,
      bannerRepository: _bannerRepository,
    )..add(HomeRequested());
    final categoriesBloc =
        CategoriesBloc(categoryRepository: _categoryRepository)
          ..add(const CategoriesRequested());
    // final subcategoriesBloc =
    //     SubcategoriesBloc(subcategoryRepository: _subcategoryRepository);
    final addressBloc = AddressBloc(
      addressRepository: _addressRepository,
    )..add(AddressesRequested());
    final cartBloc = CartBloc(cartRepository: _cartRepository)
      ..add(CartInitRequested());
    final favoritesBloc = FavoritesBloc(productRepository: _productRepository)
      ..add(FavoritesInitRequested());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _bannerRepository),
        RepositoryProvider.value(value: _categoryRepository),
        RepositoryProvider.value(value: _subcategoryRepository),
        RepositoryProvider.value(value: _productRepository),
        RepositoryProvider.value(value: _cartRepository),
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _addressRepository),
        RepositoryProvider.value(value: _orderRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: homeBloc),
          BlocProvider.value(value: languageBloc),
          BlocProvider.value(value: categoriesBloc),
          // BlocProvider.value(value: subcategoriesBloc),
          BlocProvider.value(value: addressBloc),
          BlocProvider.value(value: authBloc),
          BlocProvider.value(value: favoritesBloc),
          BlocProvider<ProductsBloc>(
            create: (context) =>
                ProductsBloc(productRepository: _productRepository),
            // lazy: true,
          ),
          BlocProvider<ProductDetailsBloc>(
            create: (context) =>
                ProductDetailsBloc(productRepository: _productRepository),
            lazy: true,
          ),
          BlocProvider.value(value: cartBloc),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScreenUtilInit(
              designSize: Size(constraints.maxWidth, constraints.maxHeight),
              builder: (context, child) => const AppView(),
            );
          },
        ),
      ),
    );
  }
}
