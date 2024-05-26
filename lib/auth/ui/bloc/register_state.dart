// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
  });
  final Phone phone;
  final FormzSubmissionStatus status;
  final bool valid;

  RegisterState copyWith({
    Phone? phone,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return RegisterState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object> get props => [
        phone,
        status,
        valid,
      ];
}
