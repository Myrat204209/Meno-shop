// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

import 'package:meno_shop/cart/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CartState.initial()) {
    on<CartInitRequested>(_onInitRequested);
    on<CartRequested>(_onRequested);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartClearRequested>(_onClearRequested);
  }

  final CartRepository _cartRepository;

  FutureOr<void> _onInitRequested(
    CartInitRequested event,
    Emitter<CartState> emit,
  ) async {
    if (state.status != CartStatus.initial) return;
    add(CartRequested());
  }

  FutureOr<void> _onRequested(
    CartRequested event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));
      final cartResponse = await _cartRepository.getCartItems();
      // final totalCost = totalCostSum(cartResponse);
      emit(state.copyWith(
        status: CartStatus.loadingSuccess,
        cart: cartResponse,
        // totalCost: totalCost,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.loadingFailure));
      addError(error, stackTrace);
    }
  }

  /// Add a new cart item to the cart repository
  FutureOr<void> _onCartItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.loading));

      await _cartRepository.addCartItem(event.cartItem);
      final cartResponse = await _cartRepository.getCartItems();
      // final totalCost = totalCostSum(cartResponse);
      emit(
        state.copyWith(
          status: CartStatus.loadingSuccess,
          cart: cartResponse,
          // totalCost: totalCost,
        ),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  ///Clear the cart
  FutureOr<void> _onClearRequested(
    CartClearRequested event,
    Emitter<CartState> emit,
  ) {
    try {
      emit(state.copyWith(status: CartStatus.loading));

      _cartRepository.clearCart();
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

  // double totalCostSum(List<CartItem> carts) {
  //   return carts.fold(0.0, (sum, item) => sum + item.totalPrice);
  // }

  // bool isCartAdded(String productId) {
  //   return state.cart.any((item) => item!.uuid == productId);
  // }

  int showQuantity(String productId) {
    try {
      log('--------state cart ${state.cart}------');
      return state.cart.isEmpty
          ? 0
          : state.cart
              .firstWhere(
                (element) => element!.uuid == productId,
              )!
              .quantity;
    } catch (e) {
      return 0;
    }
  }
}
