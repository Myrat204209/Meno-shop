// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Phone phone;
  final FormzSubmissionStatus status;

  bool get isValid => Formz.validate([phone]);
  bool get isLoginStartable =>
      isValid && status != FormzSubmissionStatus.inProgress;

  @override
  List<Object> get props => [
        phone,
        status,
        isValid,
      ];

  LoginState copyWith({
    Phone? phone,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }
}
