part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartRequested extends CartEvent {}

final class CartInitRequested extends CartEvent {}

final class CartUpdateRequested extends CartEvent {
  final CartItem cartItem;

  const CartUpdateRequested(this.cartItem);
  @override
  List<Object> get props => [cartItem];
}
