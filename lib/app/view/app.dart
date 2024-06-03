// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/product/product.dart';
import 'package:meno_shop/app/app.dart' show AppView, AppCubit;

class App extends StatelessWidget {
  const App({
    super.key,
    required StreamController<Exception> exceptionStream,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
    required AuthRepository authRepository,
    required AddressRepository addressRepository,
    required CartRepository cartRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _authRepository = authRepository,
        _addressRepository = addressRepository,
        _cartRepository = cartRepository;
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final AuthRepository _authRepository;
  final AddressRepository _addressRepository;
  final CartRepository _cartRepository;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit();
    final languageBloc = LanguageBloc();
    final categoriesBloc = CategoriesBloc(
      categoryRepository: _categoryRepository,
    )..add(const CategoriesRequested());
    final addressBloc = AddressBloc(
      addressRepository: _addressRepository,
    )..add(AddressesRequested());
    final cartBloc = CartBloc(cartRepository: _cartRepository)
      ..add(CartInitRequested());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _categoryRepository),
        RepositoryProvider.value(value: _cartRepository),
        RepositoryProvider.value(value: _productRepository),
        RepositoryProvider.value(value: _authRepository),
        RepositoryProvider.value(value: _addressRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: categoriesBloc),
          BlocProvider.value(value: addressBloc),
          BlocProvider.value(value: addressBloc),
          BlocProvider.value(value: languageBloc),
          BlocProvider.value(value: cartBloc),
          BlocProvider.value(value: appCubit),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScreenUtilInit(
              designSize: Size(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              builder: (context, child) => const AppView(),
            );
          },
        ),
      ),
    );
  }
}
