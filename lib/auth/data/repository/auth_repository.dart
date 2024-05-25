// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Auth repository failures
abstract class AuthFailure with EquatableMixin implements Exception {
  const AuthFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class LoginFailure extends AuthFailure {
  const LoginFailure(super.error);
}

class RegisterFailure extends AuthFailure {
  const RegisterFailure(super.error);
}

class AuthVerifyFailure extends AuthFailure {
  const AuthVerifyFailure(super.error);
}

class AuthRepository {
  AuthRepository({
    required AuthClient authClient,
  }) : _authClient = authClient;
  final AuthClient _authClient;

  Future<dynamic> login(LoginRequestBody body) async {
    try {
      return await _authClient.login(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<dynamic> register(RegisterRequestBody body) async {
    try {
      return await _authClient.register(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  //TODO: Need testing before deploy
  Future<dynamic> verify(AuthOtpBody body) async {
    try {
      return await _authClient.sendOtp(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
