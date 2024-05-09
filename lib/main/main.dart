import 'package:data_provider/data_provider.dart';
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
    /// TODO: Change baseURL with ENV URL
    const defaultBaseUrl = 'http://192.168.43.28:3000/api/v1';

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
    final authenticationClient = AuthenticationClient(
      httpClient: httpClient,
      tokenStorage: tokenStorage,
    );
    final userRepository = UserRepository(
      authenticationClient: authenticationClient,
      storage: userStorage,
    );
    return App(
      userRepository: userRepository,
      exceptionStream: exceptionStream,
    );
  });
}
