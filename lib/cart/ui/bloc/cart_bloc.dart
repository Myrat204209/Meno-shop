import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_provider/data_provider.dart';

import 'package:meno_shop/cart/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  // final ProductRepository _productRepository;
  CartBloc({
    required CartRepository cartRepository,
    // required ProductRepository productRepository,
  })  : _cartRepository = cartRepository,
        // _productRepository = productRepository,
        super(const CartState.initial()) {
    on<CartInitRequested>(_onInitRequested);
    on<CartRequested>(_onRequested);
    on<CartCurrentItemCreated>(_onCurrentCreated);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartClearRequested>(_onClearRequested);
    on<CartItemOneUpdated>(_onCartItemOneUpdated);
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

  /// Current item created
  FutureOr<void> _onCurrentCreated(
    CartCurrentItemCreated event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));
      final currentItemCart =
          await _cartRepository.createCurrent(productUuid: event.uuid);

      emit(state.copyWith(
        status: CartStatus.updatingSuccess,
        currentItem: currentItemCart,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: CartStatus.updatingFailure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onCartItemAdded(
    CartItemAdded event,
    Emitter<CartState> emit,
  ) async {
    if (state.currentItem == null) return; // Ensure currentItem is not null

    try {
      emit(state.copyWith(status: CartStatus.updating));
      await _cartRepository.addCartItem(state.currentItem!);
      final cartResponse = await _cartRepository.getCartItems();
      emit(state
          .copyWith(
            status: CartStatus.updatingSuccess,
            cart: cartResponse,
          )
          .calculateTotalCost());
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
      emit(
        state.copyWith(
            currentItem: state.currentItem!.copyWith(size: event.size)),
      );
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
      emit(state.copyWith(status: CartStatus.updating));
      await _cartRepository.clearCart();
      emit(state.copyWith(
        status: CartStatus.updatingSuccess,
        cart: [],
        currentItem: null,
        totalCost: 0,
      ));
      add(CartRequested());
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

  FutureOr<void> _onCartItemOneUpdated(
    CartItemOneUpdated event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CartStatus.updating));
      final updatedItem = state.currentItem!.copyWith(
          quantity: state.currentItem!.quantity + (event.isForAdding ? 1 : -1));

      emit(state.copyWith(
        currentItem: updatedItem,
      ));
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
}
