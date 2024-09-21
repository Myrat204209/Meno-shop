part of 'checkout_bloc.dart';

enum CheckoutStatus {
  initial,
  loading,
  success,
  failure,

  completing,
  completingSuccess,
  completingFailure,
}

final class CheckoutState extends Equatable {
  const CheckoutState({
    required this.status,
  });

  const CheckoutState.initial() : this(status: CheckoutStatus.initial);
  final CheckoutStatus status;

  @override
  List<Object> get props => [status];
  
  CheckoutState copyWith({
    CheckoutStatus? status,
  }) {
    return CheckoutState(
      status: status ?? this.status,
    );
  }
}
