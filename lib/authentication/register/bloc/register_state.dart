// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.name = '',
    this.surname = '',
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final String name;
  final String surname;
  final Phone phone;
  final FormzSubmissionStatus status;
  bool get isValid => Formz.validate([phone]);
  bool get isLoginStartable =>
      isValid && status != FormzSubmissionStatus.inProgress;

  RegisterState copyWith({
    String? name,
    String? surname,
    Phone? phone,
    FormzSubmissionStatus? status,
  }) {
    return RegisterState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        name,
        surname,
        phone,
        status,
      ];
}
