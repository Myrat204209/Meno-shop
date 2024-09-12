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
  final String productUuid;

  const CartItemAdded({required this.productUuid});

  @override
  List<Object?> get props => [productUuid];
}

final class CartItemQuantityUpdated extends CartEvent {
  final String productId;
  final int quantity;

  const CartItemQuantityUpdated({required this.productId, required this.quantity});

  @override
  List<Object?> get props => [productId, quantity];
}

final class CartItemSizeSelected extends CartEvent {
  final String productId;
  final String size;

  const CartItemSizeSelected({required this.productId, required this.size});

  @override
  List<Object?> get props => [productId, size];
}
