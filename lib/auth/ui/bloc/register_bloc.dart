import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:meno_shop/auth/auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const RegisterState()) {
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }
  final AuthRepository _authRepository;

  void _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phone = Phone.dirty(event.phone);

    emit(
      state.copyWith(
        phone: phone,
        valid: Formz.validate([phone]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.valid) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    try {
      await _authRepository.register(
        RegisterRequestBody(
          phone: state.phone.value,
        ),
      );
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
      addError(error, stackTrace);
    }
  }
}
