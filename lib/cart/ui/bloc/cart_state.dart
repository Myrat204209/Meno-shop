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
    this.cart,
  });
  const CartState.initial() : this(status: CartStatus.initial);
  final CartStatus status;
  final Cart? cart;
  bool get isCartEmpty => cart?.items?.isEmpty ?? true;

  @override
  List<Object?> get props => [status, cart];

  CartState copyWith({
    CartStatus? status,
    Cart? cart,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
    );
  }
}
