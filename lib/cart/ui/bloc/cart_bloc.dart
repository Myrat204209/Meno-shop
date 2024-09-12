import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_provider/data_provider.dart';

import 'package:meno_shop/cart/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CartState.initial()) {
    on<CartInitRequested>(_onInitRequested);
    on<CartRequested>(_onRequested);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartClearRequested>(_onClearRequested);
    on<CartItemQuantityUpdated>(_onCartItemQuantityUpdated);
    on<CartItemSizeSelected>(_onCartItemSizeSelected);
  }

  // Initialize the cart
  FutureOr<void> _onInitRequested(
    CartInitRequested event,
    Emitter<CartState> emit,
  ) async {
    if (state.status != CartStatus.initial) return;
    add(CartRequested());
  }

  // Handle loading the cart items
  FutureOr<void> _onRequested(
    CartRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));
      final cartResponse = await _cartRepository.getCartItems();
      emit(state
          .copyWith(
            status: CartStatus.loadingSuccess,
            cart: cartResponse,
          )
          .calculateTotalCost()); // Update total cost
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.loadingFailure));
      addError(error, stackTrace);
    }
  }

  // Add item to cart
  FutureOr<void> _onCartItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));
      await _cartRepository.addCartItem(event.productUuid); // Pass only UUID
      final cartResponse = await _cartRepository.getCartItems();
      emit(state
          .copyWith(
            status: CartStatus.updatingSuccess,
            cart: cartResponse,
          )
          .calculateTotalCost()); // Update total cost
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  // Update item quantity in the cart
  FutureOr<void> _onCartItemQuantityUpdated(
    CartItemQuantityUpdated event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));
      await _cartRepository.updateCartItemQuantity(
          event.productId, event.quantity);
      final cartResponse = await _cartRepository.getCartItems();
      emit(state
          .copyWith(
            status: CartStatus.updatingSuccess,
            cart: cartResponse,
          )
          .calculateTotalCost()); // Update total cost
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  // Select size for the product
  FutureOr<void> _onCartItemSizeSelected(
    CartItemSizeSelected event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));
      await _cartRepository.updateCartItemSize(event.productId, event.size);
      final cartResponse = await _cartRepository.getCartItems();
      emit(state
          .copyWith(
            status: CartStatus.updatingSuccess,
            cart: cartResponse,
          )
          .calculateTotalCost()); // Update total cost
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  // Clear the cart
  FutureOr<void> _onClearRequested(
    CartClearRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));
      await _cartRepository.clearCart();
      emit(state.copyWith(
        status: CartStatus.loadingSuccess,
        cart: [],
        totalCost: 0,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  // Additional utility methods
  int showQuantity(String productId) {
    try {
      return state.cart.isEmpty
          ? 0
          : state.cart
                  .firstWhere((item) => item?.uuid == productId)
                  ?.quantity ??
              0;
    } catch (e) {
      return 0;
    }
  }

  bool isCartAdded(String productId) {
    return state.cart.any((item) => item?.uuid == productId);
  }
}
