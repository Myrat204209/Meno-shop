import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:meno_shop/auth/auth.dart';
import 'package:meno_shop/env/env.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:secure_storage/secure_storage.dart';
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
    const secureStorage = SecureStorage();

    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tm',
    );

    /// Auth and User
    final authClient =
        AuthClient(httpClient: httpClient, tokenStorage: tokenStorage);
    final authRepository = AuthRepository(authClient: authClient);

    return App(
      exceptionStream: exceptionStream,
    );
  });
}
