// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

abstract class CartFailure with EquatableMixin implements Exception {
  const CartFailure(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetCartFailure extends CartFailure {
  const GetCartFailure(super.error);
}

class GetCartSummaryFailure extends CartFailure {
  const GetCartSummaryFailure(super.error);
}

class UpdateCartFailure extends CartFailure {
  const UpdateCartFailure(super.error);
}

class UpdateCartItemFailure extends CartFailure {
  const UpdateCartItemFailure(super.error);
}

class CompleteCartFailure extends CartFailure {
  const CompleteCartFailure(super.error);
}

class CartRepository {
  CartRepository({
    required UserCartBox userCartBox,
  }) : _userCartBox = userCartBox;
  final UserCartBox _userCartBox;

  Future<List<CartItem>> getCart() async {
    try {
      return _userCartBox.values.toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCartFailure(error), stackTrace);
    }
  }

  Future<void> updateCart(CartItem cartItem) async {
    try {
      if (cartItem.quantity > 0) {
        await _userCartBox.put(cartItem.productId, cartItem);
      } else {
        await _userCartBox.delete(cartItem.productId);
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartFailure(error), stackTrace);
    }
  }
}
