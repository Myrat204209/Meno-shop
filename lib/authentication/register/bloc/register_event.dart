part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegisterSurnameChanged extends RegisterEvent {
  const RegisterSurnameChanged(this.surname);

  final String surname;

  @override
  List<Object> get props => [surname];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);
  final String phone;
  @override
  List<Object> get props => [phone];
}

class RegisterStarted extends RegisterEvent {}
