part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class CartInitRequested extends CartEvent {}

final class CartClearRequested extends CartEvent {}

final class CartRequested extends CartEvent {}

final class CartItemAdded extends CartEvent {
  final CartItem cartItem;

  const CartItemAdded({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}
