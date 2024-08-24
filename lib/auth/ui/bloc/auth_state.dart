// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
}

class AuthState extends Equatable {

  const AuthState({
    required this.status,
    this.user,
  });
  const AuthState.initial() : this(status: AuthStatus.initial);

  final AuthStatus status;
  final User? user;

  bool get isAuthenticated => user != null;
  
  @override
  List<Object?> get props => [status, user];

  AuthState copyWith({
    AuthStatus? status,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
