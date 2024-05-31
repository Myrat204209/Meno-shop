import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/env/env.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import '../app/app.dart';

void main() {
  bootStrap(({
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    const defaultBaseUrl = Env.serverUrl;

    /// Storages
    final tokenStorage = InMemoryTokenStorage();
    // const secureStorage = SecureStorage();

    // /// Only for development
    //   HttpOverrides.global = MyHttpOverrides();
    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tm',
    );

    // /// Sliders
    // final sliderClient = SliderClient(httpClient: httpClient);
    // final sliderRepository = SliderRepository(sliderClient: sliderClient);

    /// Categories
    final categoryClient = CategoryClient(httpClient: httpClient);
    final categoryRepository =
        CategoryRepository(categoryClient: categoryClient);

    // /// Brands
    // final brandClient = BrandClient(httpClient: httpClient);
    // final brandRepository = BrandRepository(brandClient: brandClient);

    /// Products
    // final productClient = ProductClient(httpClient: httpClient);
    // final productRepository = ProductRepository(productClient: productClient);

    // /// Auth
    // final authClient = AuthClient(
    //   httpClient: httpClient,
    //   tokenStorage: tokenStorage,
    // );

    // /// Addresses
    // Hive.registerAdapter(AddressModelAdapter());
    // final userAddressBox =
    //     await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    // final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    // /// Cart
    final cartClient = CartClient(httpClient: httpClient);
    final cartRepository = CartRepository(cartClient: cartClient);

    final authRepository = AuthRepository(authClient: authClient);
    return App(
      exceptionStream: exceptionStream,
    );
  });
}
