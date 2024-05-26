import 'dart:async';

import 'package:data_provider/data_provider.dart';
import 'package:user_repository/user_repository.dart';
part 'user_exceptions.dart';

///Repository which manages the user domain
class UserRepository {
  /// {@macro user_repository}

  UserRepository({
    required AuthClient authClient,
    required UserStorage storage,
  })  : _authClient = authClient,
        _storage = storage;

  final AuthClient _authClient;
  final StreamController<User> _userStream = StreamController();
  final UserStorage _storage;

  /// Stream of [User] which will emit the current user
  Stream<User> get user => _userStream.stream;

  /// Tries to login the user
  /// using the saved credentials
  ///  If failure anonymous user is streamed
  Future<void> logInWithSavedCredentials() async {
    try {
      final phone = await _storage.fetchAppUserPhone();

      if (phone != null) {
        //Todo: LogInWithSavedCredentials function implementation here
      } else {}
    } catch (e) {
      //Todo: Throw an error if logInWithSavedCredentials fails
    }
  }

  /// Starts the Register with phone, name, surname
  ///
  /// Throws a [RegisterFailure] if an exception occurs
  Future<AuthResponse> register({
    required String phone,
  }) async {
    try {
      final response = await _authClient.register(body: AuthRequestBody(phone));
      await _storage.setAppUserPhone(phone);
      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(RegisterFailure(error), stackTrace);
    }
  }

  /// Starts the Sign In with phone and password
  ///
  /// Throws a [LogInFailure] if an exception occurs
  Future<AuthResponse> logIn({
    required String phone,
  }) async {
    try {
      final response = await _authClient.logIn(AuthRequestBody(phone));
      await _storage.setAppUserPhone(phone);
      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(LogInFailure(error), stackTrace);
    }
  }

  /// Starts the Sign Out
  ///
  /// Throws a [LogOutFailure] if an exception occurs
  Future<void> logOut() async {
    try {
      await _authClient.logOut();
      _userStream.add(User.anonymous);
      await _storage.clearAppUser();
    } catch (error, stackTrace) {
      _userStream.add(User.anonymous);
      Error.throwWithStackTrace(LogOutFailure(error), stackTrace);
    }
  }
}
