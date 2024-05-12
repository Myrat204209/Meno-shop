import 'package:data_provider/data_provider.dart';
import 'package:meno_shop/env/env.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:user_repository/user_repository.dart';
import '../app/app.dart';

void main() {
  bootStrap((
    sharedPreferences,
    exceptionStream,
  ) async {
    /// Constants
    const defaultBaseUrl = Env.serverUrl;

    /// Storages
    final tokenStorage = InMemoryTokenStorage();
    const secureStorage = SecureStorage();
    const userStorage = UserStorage(storage: secureStorage);

    /// HTTP Client
    final httpClient = Http(
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
    );

    /// Authentication and User
    final authClient = AuthClient(
      httpClient: httpClient,
      tokenStorage: tokenStorage,
    );
    final userRepository = UserRepository(
      authClient: authClient,
      storage: userStorage,
    );
    return App(
      userRepository: userRepository,
      exceptionStream: exceptionStream,
    );
  });
}
