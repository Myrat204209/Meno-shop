part of 'authentication_bloc.dart';

//Todo: Difference btwn sealed and abstract
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {
  const AuthenticationLogoutRequested();
}

class AuthenticationUserChanged extends AuthenticationEvent {
  const AuthenticationUserChanged(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}
