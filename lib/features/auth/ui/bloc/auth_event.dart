part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthUserRequested extends AuthEvent {}

final class AuthVerifyRequested extends AuthEvent {
  final String phone;
  final String otp;

  const AuthVerifyRequested({
    required this.phone,
    required this.otp,
  });

  @override
  List<Object> get props => [phone, otp];
}
