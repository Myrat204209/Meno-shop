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
    on<RegisterNameChanged>(_onRegisterNameChanged);
    on<RegisterSurnameChanged>(_onRegisterSurnameChanged);
    on<RegisterPhoneChanged>(_onRegisterPhoneChanged);
    on<RegisterStarted>(_onRegisterStarted);
  }
  final UserRepository _userRepository;

  FutureOr<void> _onRegisterNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final name = event.name;
    emit(state.copyWith(name: name));
  }

  FutureOr<void> _onRegisterSurnameChanged(
    RegisterSurnameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final surname = event.surname;
    emit(state.copyWith(surname: surname));
  }

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
        name: state.name,
        surname: state.surname,
        phone: state.phone.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
