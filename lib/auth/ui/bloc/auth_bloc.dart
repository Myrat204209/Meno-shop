import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.initial()) {
    on<AuthVerifyRequested>(_onVerifyRequested);
    on<AuthUserRequested>(_onUserRequested);
  }
  final AuthRepository _authRepository;

  FutureOr<void> _onVerifyRequested(
    AuthVerifyRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      await _authRepository.checkOtp(
        body: AuthRequestBody(event.phone, event.otp),
      );

      emit(state.copyWith(
        status: AuthStatus.success,
        user: User.anonymous(phoneNumber: event.phone),
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUserRequested(
    AuthUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      final user = await _authRepository.getMe();

      emit(state.copyWith(
        status: AuthStatus.success,
        user: user,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }
}
