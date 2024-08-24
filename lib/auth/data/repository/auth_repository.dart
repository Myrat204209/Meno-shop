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

class AuthenticationFailure extends AuthFailure {
  const AuthenticationFailure(super.error);
}

class AuthVerifyFailure extends AuthFailure {
  const AuthVerifyFailure(super.error);
}

class AuthCheckFailure extends AuthFailure {
  const AuthCheckFailure(super.error);
}

class GetMeFailure extends AuthFailure {
  const GetMeFailure(super.error);
}

class AuthRepository {
  AuthRepository({
    required AuthClient authClient,
  }) : _authClient = authClient;
  final AuthClient _authClient;

  Future<String?> auth(AuthRequestBody body) async {
    try {
      final response = await _authClient.auth(body);
      final token = response.token;
      if (token != null) {
        return token;
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationFailure(error), stackTrace);
    }
    return null;
  }

  Future<void> sendOtp({required AuthRequestBody body}) async {
    try {
      await _authClient.sendOtp(body: body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthVerifyFailure(error), stackTrace);
    }
  }

  Future<void> checkOtp({
    required AuthRequestBody body,
  }) async {
    try {
      await _authClient.checkOtp(body: body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthCheckFailure(error), stackTrace);
    }
  }

  Future<User> getMe() async {
    try {
      return await _authClient.getMe();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetMeFailure(error), stackTrace);
    }
  }

  Future<User> putMe({required User user}) async {
    try {
      return await _authClient.putMe(user: user);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetMeFailure(error), stackTrace);
    }
  }
}
