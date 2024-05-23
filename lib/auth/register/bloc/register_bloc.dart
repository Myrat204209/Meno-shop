import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const RegisterState()) {
    on<RegisterPhoneChanged>(_onRegisterPhoneChanged);
    on<RegisterStarted>(_onRegisterStarted);
  }
  final UserRepository _userRepository;

  FutureOr<void> _onRegisterPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phone = Phone.dirty(event.phone);
    emit(state.copyWith(phone: phone));
  }

  FutureOr<void> _onRegisterStarted(
    RegisterStarted event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.isLoginStartable) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.register(
        phone: state.phone.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
