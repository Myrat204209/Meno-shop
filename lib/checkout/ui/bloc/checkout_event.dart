part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

final class CheckoutRequested extends CheckoutEvent {}

// final class CheckoutPaymentMethodUpdated extends CheckoutEvent {}

// final class CheckoutDeliveryTypeUpdated extends CheckoutEvent {}

final class CheckoutCompleteRequested extends CheckoutEvent {
  final String? notes;
  final String address;
  final String phone;

  const CheckoutCompleteRequested({
    required this.notes,
    required this.address,
    required this.phone,
  });
  @override
  List<Object?> get props => [
        phone,
        notes,
        address,
      ];
}
