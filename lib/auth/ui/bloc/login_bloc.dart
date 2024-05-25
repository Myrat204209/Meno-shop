import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/auth/auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginPhoneChanged>(_onLoginPhoneChanged);
    on<LoginPhoneSubmitted>(_onLoginStarted);
  }

  final AuthRepository _authRepository;
  FutureOr<void> _onLoginPhoneChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) {
    final phone = Phone.dirty(event.phone);

    emit(state.copyWith(
      phone: phone,
      valid: Formz.validate([phone]),
    ));
  }

  FutureOr<void> _onLoginStarted(
    LoginPhoneSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.valid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authRepository.login(LoginRequestBody(
        phone: state.phone.value,
      ));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
