// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  loadingSuccess,
  loadingFailure,
  updating,
  updatingSuccess,
  updatingFailure,
}

class CartState extends Equatable {
  const CartState({
    required this.status,
    this.cart = const [],
    this.totalCost = 0.0,
  });

  const CartState.initial() : this(status: CartStatus.initial);

  final CartStatus status;
  final List<CartItem?> cart;
  final double totalCost;

  @override
  List<Object?> get props => [
        status,
        cart,
        totalCost,
      ];

  CartState copyWith({
    CartStatus? status,
    List<CartItem?>? cart,
    double? totalCost,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      totalCost: totalCost ?? this.totalCost,
    );
  }

  /// Calculates the total cost based on the current cart items
  CartState calculateTotalCost() {
    final total = cart.fold(
      0.0,
      (sum, item) => sum + (item?.price ?? 0.0) * (item?.quantity ?? 0),
    );
    return copyWith(totalCost: total);
  }
}
