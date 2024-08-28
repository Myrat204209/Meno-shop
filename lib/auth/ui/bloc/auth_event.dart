part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSendOtpRequested extends AuthEvent {
  final String phone;

  const AuthSendOtpRequested({required this.phone});

  @override
  List<Object> get props => [phone];
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

final class AuthUserGetRequested extends AuthEvent {}

final class AuthUserPutRequested extends AuthEvent {
  final UserRequestBody userBody;

  const AuthUserPutRequested({required this.userBody});

  @override
  List<Object> get props => [userBody];
}
