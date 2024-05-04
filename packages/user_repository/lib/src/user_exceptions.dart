part of 'user_repository.dart';

/// {@template authentication_exception}
/// Exceptions from the authentication client.
/// {@endtemplate}
abstract class UserException implements Exception {
  /// {@macro authentication_exception}
  const UserException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template get_user_failure}
/// Thrown during the fetching process occurs failure.
/// {@endtemplate}
class GetUserFailure extends UserException {
  /// {@macro get_user_failure}
  const GetUserFailure(super.error);
}

/// {@template log_in_failure}
/// Thrown during the sign in a process occurs failure.
/// {@endtemplate}
class LogInFailure extends UserException {
  /// {@macro log_in_failure}
  const LogInFailure(super.error);
}

/// {@template log_in_cancelled}
/// Thrown during before the sign in process started.
/// {@endtemplate}
class LogInCancelled extends UserException {
  /// {@macro log_in_cancelled}
  const LogInCancelled(super.error);
}

/// {@template register_failure}
/// Thrown during the register process occurs failure.
/// {@endtemplate}
class RegisterFailure extends UserException {
  /// {@macro register_failure}
  const RegisterFailure(super.error);
}

/// {@template register_cancelled}
/// Thrown during before the register process started.
/// {@endtemplate}
class RegisterCancelled extends UserException {
  /// {@macro register_cancelled}
  const RegisterCancelled(super.error);
}

/// {@template change_password_failure}
/// Thrown during the change password process occurs failure.
/// {@endtemplate}
class ChangePasswordFailure extends UserException {
  /// {@macro change_password_failure}
  const ChangePasswordFailure(super.error);
}

/// {@template change_password_cancelled}
/// Thrown during before the register process started.
/// {@endtemplate}
class ChangePasswordCancelled extends UserException {
  /// {@macro change_password_cancelled}
  const ChangePasswordCancelled(super.error);
}

/// {@template log_out_failure}
/// Thrown during the sign in a process occurs failure.
/// {@endtemplate}
class LogOutFailure extends UserException {
  /// {@macro log_out_failure}
  const LogOutFailure(super.error);
}
