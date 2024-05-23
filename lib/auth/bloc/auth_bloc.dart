import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const AuthState.iniital()) {
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthUserChanged>(_onUserChanged);

    _userSubscription = _userRepository.user.listen(_userChanged);

    // try authenticate on app initialization
    _authenticateViaSavedCredentials();
  }

  final UserRepository _userRepository;
  late StreamSubscription _userSubscription;

  void _userChanged(User user) => add(AuthUserChanged(user));
  void _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    try {
      unawaited(_userRepository.logOut());
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _authenticateViaSavedCredentials() async {
    try {
      //Auth process
      await _userRepository.logInWithSavedCredentials();
    } on LogInCancelled {
      add(const AuthLogoutRequested());
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      add(const AuthLogoutRequested());
    }
  }

  void _onUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    final user = event.user;
    if (user == User.anonymous) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
