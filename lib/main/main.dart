import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meno_shop/addresses/address.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:data_provider/data_provider.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/product/product.dart';
import 'package:flutter/foundation.dart';
import 'package:meno_shop/subcategories/subcategories.dart';
import '../app/app.dart';

const kDefaultBaseUrl = 'http://192.168.30.238:3000';
void main() {
  bootStrap(({
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

    /// Addresses
    Hive.registerAdapter(AddressModelAdapter());
    final userAddressBox =
        await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    /// Cart
    Hive.registerAdapter(CartItemAdapter());
    final userCartBox = await Hive.openBox<CartItem>(HiveBoxKeys.userCart);
    final cartRepository = CartRepository(userCartBox: userCartBox);

    /// Favorites
    Hive.registerAdapter(ProductItemAdapter());
    final userFavoritesBox =
        await Hive.openBox<ProductItem>(HiveBoxKeys.userFavorites);

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(
      productClient: productClient,
      userFavoritesBox: userFavoritesBox,
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
    );
  });
}
