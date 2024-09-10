import 'dart:developer';

import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the Cart repository failures
abstract class CartFailure with EquatableMixin implements Exception {
  const CartFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetCartItemsFailure extends CartFailure {
  const GetCartItemsFailure(super.error);
}

class ClearCartFailure extends CartFailure {
  const ClearCartFailure(super.error);
}

class UpdateCartItemFailure extends CartFailure {
  const UpdateCartItemFailure(super.error);
}

class CartRepository {
  const CartRepository({
    required UserCartBox cartItemBox,
  }) : _cartItemBox = cartItemBox;

  final UserCartBox _cartItemBox;

  /// Get all cart items
  Future<List<CartItem>> getCartItems() async {
    try {
      return _cartItemBox.values.toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCartItemsFailure(error), stackTrace);
    }
  }

  ///Clear all cart items
  Future<void> clearCart() async {
    try {
      await _cartItemBox.clear();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ClearCartFailure(error), stackTrace);
    }
  }

  /// Add  cart item
  Future<void> addCartItem(CartItem cartItem) async {
    try {
      if (_cartItemBox.containsKey(cartItem.uuid)) {
        if (cartItem.quantity > 0) {
          await _cartItemBox.put(cartItem.uuid, cartItem);
        } else {
          log('---------cartItemBox.delete ${cartItem.uuid} _------');
          await _cartItemBox.delete(cartItem.uuid);
        }
      } else {
        if (cartItem.quantity > 0) {
          await _cartItemBox.put(cartItem.uuid, cartItem);
        }
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartItemFailure(error), stackTrace);
    }
  }
}
