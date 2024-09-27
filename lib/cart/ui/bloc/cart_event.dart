part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class CartInitRequested extends CartEvent {}

final class CartClearRequested extends CartEvent {}

final class CartRequested extends CartEvent {}

final class CartCurrentItemCreated extends CartEvent {
  final String uuid;

  const CartCurrentItemCreated({required this.uuid});
  @override
  List<Object?> get props => [uuid];
}

final class CartProductsAdded extends CartEvent {
  final List<String> productUuids; // List of product UUIDs

  const CartProductsAdded({required this.productUuids});

  @override
  List<Object?> get props => [productUuids];
}

final class CartItemAdded extends CartEvent {}

final class CartItemOneUpdated extends CartEvent {
  final bool isForAdding;

  const CartItemOneUpdated({required this.isForAdding});

  @override
  List<Object?> get props => [isForAdding];
}

final class CartItemSizeSelected extends CartEvent {
  final String size;

  const CartItemSizeSelected({required this.size});

  @override
  List<Object?> get props => [size];
}
