
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
    this.currentItem,
  });

  const CartState.initial() : this(status: CartStatus.initial);

  final CartStatus status;
  final List<CartItem?> cart;
  final double totalCost;
  final CartItem? currentItem;

  @override
  List<Object?> get props => [
        status,
        cart,
        totalCost,
        currentItem,
      ];

  CartState copyWith({
    CartStatus? status,
    List<CartItem?>? cart,
    double? totalCost,
    CartItem? currentItem,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      totalCost: totalCost ?? this.totalCost,
      currentItem: currentItem ?? this.currentItem
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
