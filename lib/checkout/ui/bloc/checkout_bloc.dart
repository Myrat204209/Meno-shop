import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/orders/orders.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required CartRepository cartRepository,
    required OrderRepository orderRepository,
  })  : _cartRepository = cartRepository,
        _orderRepository = orderRepository,
        super(const CheckoutState.initial()) {
    on<CheckoutRequested>(_onRequested);
    on<CheckoutCompleteRequested>(_onCompleteRequested);
  }
  final CartRepository _cartRepository;
  final OrderRepository _orderRepository;

  FutureOr<void> _onRequested(
    CheckoutRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CheckoutStatus.loading));

      final cartItems = await _cartRepository.getCartItems();

      if (cartItems.isEmpty) {
        emit(state.copyWith(status: CheckoutStatus.failure));
        return;
      }

      emit(state.copyWith(status: CheckoutStatus.success));
    } catch (error, stackTrace) {
      // Step 4: Handle errors and emit failure state
      emit(state.copyWith(status: CheckoutStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onCompleteRequested(
    CheckoutCompleteRequested event,
    Emitter<CheckoutState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CheckoutStatus.completing));

      final cartItems = await _cartRepository.getCartItems();
      if (cartItems.isEmpty) {
        throw Exception("No items in the cart.");
      }

      final orderItems = OrderItem(
        products: cartItems,
        address: event.address,
        notes: event.notes,
      );

      // final orderBody = OrderCreateRequestBody(
      //   items: orderItems,
      //   address: event.address,
      //   phone: event.phone,
      // );

      await _orderRepository.createOrder(orderItems);

      emit(state.copyWith(status: CheckoutStatus.completingSuccess));
    } catch (error, stackTrace) {
      // Step 4: Handle error and emit failure state
      emit(state.copyWith(status: CheckoutStatus.completingFailure));
      addError(error, stackTrace);
    }
  }
}
