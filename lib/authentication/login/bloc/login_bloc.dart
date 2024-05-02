import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const LoginState()) {
    on<LoginPhoneChanged>(_onLoginPhoneChanged);
    on<LoginStarted>(_onLoginStarted);
  }

  final UserRepository _userRepository;
  FutureOr<void> _onLoginPhoneChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) {
    final phone = Phone.dirty(event.phone);

    emit(state.copyWith(
      phone: phone,
    ));
  }
  FutureOr<void> _onLoginStarted(
    LoginStarted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isLoginStartable) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logIn(
        phone: state.phone.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
