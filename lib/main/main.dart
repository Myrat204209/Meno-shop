import 'dart:io';

import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:data_provider/data_provider.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/product/product.dart';
import 'package:flutter/foundation.dart';
import 'package:meno_shop/subcategories/subcategories.dart';
import '../app/app.dart';

const kDefaultBaseUrl = 'http://192.168.1.103:3000';
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

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(productClient: productClient);

    /// Auth
    // final authClient =
    //     AuthClient(httpClient: httpClient, tokenStorage: tokenStorage);
    // final authRepository = AuthRepository(authClient: authClient);

    /// Addresses
    // Hive.registerAdapter(AddressModelAdapter());
    // final userAddressBox =
    //     await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    // final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    // /// Cart
    // final cartClient = CartClient(httpClient: httpClient);
    // final cartRepository = CartRepository(cartClient: cartClient);

    return App(
      // exceptionStream: exceptionStream,
      bannerRepository: bannerRepository,
      categoryRepository: categoryRepository,
      subcategoryRepository: subcategoryRepository,
      productRepository: productRepository,
      // authRepository: authRepository,
      // addressRepository: addressRepository,
      // cartRepository: cartRepository,
    );
  });
}
