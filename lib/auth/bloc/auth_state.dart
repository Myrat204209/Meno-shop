part of 'auth_bloc.dart';

enum AuthStatus {
  initial(),
  authenticated(),
  unauthenticated(),
}

class AuthState extends Equatable {
  final AuthStatus status;
  final User user;

  //Opening the app first time
  const AuthState({
    required this.status,
    this.user = User.anonymous,
  });

  // User authenticates successfully
  const AuthState.authenticated(
    User user,
  ) : this(
          status: AuthStatus.authenticated,
          user: user,
        );
  const AuthState.iniital()
      : this(
          status: AuthStatus.initial,
        );
  const AuthState.unauthenticated()
      : this(
          status: AuthStatus.unauthenticated,
        );

  // ?
  AuthState copyWith({
    AuthStatus? status,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        status,
        user,
      ];
}
