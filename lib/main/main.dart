import 'dart:io';

import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive;
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:meno_shop/orders/data/data.dart';
import 'package:meno_shop/products/products.dart';
import 'package:meno_shop/subcategories/subcategories.dart';

import '../app/app.dart';

void main() {
  bootStrap(({
    required firebaseMessaging,
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    const defaultBaseUrl = '$kDefaultBaseUrl/api/v1';

    /// Storages
    // const secureStorage = SecureStorage();
    final tokenStorage = InMemoryTokenStorage();

    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tm',
    );

    /// Only for development
    HttpOverrides.global = MyHttpOverrides();

    /// Banners
    final bannerClient = BannerClient(httpClient: httpClient);
    final bannerRepository = BannerRepository(bannerClient: bannerClient);

    /// Categories
    final categoryClient = CategoryClient(httpClient: httpClient);
    final categoryRepository =
        CategoryRepository(categoryClient: categoryClient);

    /// Subcategories
    final subcategoryClient = SubcategoryClient(httpClient: httpClient);
    final subcategoryRepository =
        SubcategoryRepository(subcategoryClient: subcategoryClient);
    final orderClient = OrderClient(httpClient: httpClient);
    final orderRepository = OrderRepository(orderClient: orderClient);

    /// Addresses
    Hive.registerAdapter(AddressModelAdapter());
    final userAddressBox =
        await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    /// Favorites
    final userFavoritesBox =
        await Hive.openBox<String>(HiveBoxKeys.userFavorites);

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(
      productClient: productClient,
      userFavoritesBox: userFavoritesBox,
    );

    /// Cart
    Hive.registerAdapter(CartItemAdapter());
    final userCartBox = await Hive.openBox<CartItem>(HiveBoxKeys.userCart);
    final cartRepository = CartRepository(
      cartItemBox: userCartBox,
      productRepository: productRepository,
    );

    /// Auth
    final authClient = AuthClient(
      httpClient: httpClient,
      tokenStorage: tokenStorage,
    );
    final authRepository = AuthRepository(authClient: authClient);

    return App(
      exceptionStream: exceptionStream,
      bannerRepository: bannerRepository,
      categoryRepository: categoryRepository,
      subcategoryRepository: subcategoryRepository,
      productRepository: productRepository,
      addressRepository: addressRepository,
      authRepository: authRepository,
      cartRepository: cartRepository,
      orderRepository: orderRepository,
    );
  });
}
