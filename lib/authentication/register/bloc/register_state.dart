// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final Phone phone;
  final FormzSubmissionStatus status;
  bool get isValid => Formz.validate([phone]);
  bool get isLoginStartable =>
      isValid && status != FormzSubmissionStatus.inProgress;

  RegisterState copyWith({
    Phone? phone,
    FormzSubmissionStatus? status,
  }) {
    return RegisterState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        phone,
        status,
      ];
}
