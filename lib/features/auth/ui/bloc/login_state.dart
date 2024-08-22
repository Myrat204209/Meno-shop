// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phone = const Phone.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
    this.isPrivacyPolicyChecked = false,
  });

  final Phone phone;
  final FormzSubmissionStatus status;
  final bool valid;
  final bool isPrivacyPolicyChecked;

  @override
  List<Object> get props => [
        phone,
        status,
        valid,
        isPrivacyPolicyChecked,
      ];

  LoginState copyWith({
    Phone? phone,
    FormzSubmissionStatus? status,
    bool? valid,
    bool? isPrivacyPolicyChecked,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
      valid: valid ?? this.valid,
      isPrivacyPolicyChecked:
          isPrivacyPolicyChecked ?? this.isPrivacyPolicyChecked,
    );
  }
}
