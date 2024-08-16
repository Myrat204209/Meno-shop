// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'cart_bloc.dart';

enum CartStatus {
  initial,

  ///Fetching cart process
  loading,
  loadingSuccess,
  loadingFailure,

  /// Updating cart process
  updating,
  updatingSuccess,
  updatingFailure,
}

class CartState extends Equatable {
  const CartState({
    required this.status,
    this.cart = const [],
  });
  const CartState.initial() : this(status: CartStatus.initial);
  final CartStatus status;

  final List<CartItem?>? cart;
  @override
  List<Object?> get props => [status, cart];

  CartState copyWith({
    CartStatus? status,
    List<CartItem?>? cart,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
    );
  }
}
