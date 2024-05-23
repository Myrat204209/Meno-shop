part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);
  final String phone;
  @override
  List<Object> get props => [phone];
}

class RegisterStarted extends RegisterEvent {}
