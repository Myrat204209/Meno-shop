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

class AuthSendOtpFailure extends AuthFailure {
  const AuthSendOtpFailure(super.error);
}

class AuthCheckOtpFailure extends AuthFailure {
  const AuthCheckOtpFailure(super.error);
}

class GetMeFailure extends AuthFailure {
  const GetMeFailure(super.error);
}

class AuthRepository {
  AuthRepository({
    required AuthClient authClient,
  }) : _authClient = authClient;
  final AuthClient _authClient;

  Future<String?> auth({required String phone}) async {
    try {
      final response = await _authClient.auth(phone: phone);
      final token = response.token;
      if (token != null) {
        return token;
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationFailure(error), stackTrace);
    }
    return null;
  }

  Future<void> sendOtp({required AuthRequestBody sendOtp}) async {
    try {
      await _authClient.sendOtp(sendOtpbody: sendOtp);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthSendOtpFailure(error), stackTrace);
    }
  }

  Future<void> checkOtp({required AuthRequestBody checkOtp}) async {
    try {
      await _authClient.checkOtp(checkOtpbody: checkOtp);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthCheckOtpFailure(error), stackTrace);
    }
  }

  // Future<User> getMe() async {
  //   try {
  //     return await _authClient.getMe();
  //   } catch (error, stackTrace) {
  //     Error.throwWithStackTrace(GetMeFailure(error), stackTrace);
  //   }
  // }

  // Future<User> putMe({required UserRequestBody userBody}) async {
  //   try {
  //     return await _authClient.putMe(userBody: userBody);
  //   } catch (error, stackTrace) {
  //     Error.throwWithStackTrace(GetMeFailure(error), stackTrace);
  //   }
  // }
}
