part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthCheckOtpRequested extends AuthEvent {
  final String phone;
  final String otp;

  const AuthCheckOtpRequested({
    required this.phone,
    required this.otp,
  });

  @override
  List<Object> get props => [phone, otp];
}

final class AuthLoginRequested extends AuthEvent {
  final String phone;

  const AuthLoginRequested({
    required this.phone,
  });

  @override
  List<Object> get props => [phone];
}

final class AuthUserPutRequested extends AuthEvent {
  final UserRequestBody userBody;

  const AuthUserPutRequested({required this.userBody});

  @override
  List<Object> get props => [userBody];
}

// final class AuthUserGetRequested extends AuthEvent {}