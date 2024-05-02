part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  initial(),
  authenticated(),
  unauthenticated(),
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  //Opening the app first time
  const AuthenticationState({
    required this.status,
    this.user = User.anonymous,
  });

  // User authenticates successfully
  const AuthenticationState.authenticated(
    User user,
  ) : this(
          status: AuthenticationStatus.authenticated,
          user: user,
        );
  const AuthenticationState.iniital()
      : this(
          status: AuthenticationStatus.initial,
        );
  const AuthenticationState.unauthenticated()
      : this(
          status: AuthenticationStatus.unauthenticated,
        );

  // ?
  AuthenticationState copyWith({
    AuthenticationStatus? status,
    User? user,
  }) {
    return AuthenticationState(
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

