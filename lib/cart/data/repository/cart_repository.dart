import 'dart:developer';

import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/products/products.dart';

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

class CreateCurrentFailure extends CartFailure {
  const CreateCurrentFailure(super.error);
}

class UpdateCartItemFailure extends CartFailure {
  const UpdateCartItemFailure(super.error);
}

class UpdateCartItemQuantityFailure extends CartFailure {
  const UpdateCartItemQuantityFailure(super.error);
}

class UpdateCartItemSizeFailure extends CartFailure {
  const UpdateCartItemSizeFailure(super.error);
}

class CartRepository {
  const CartRepository({
    required UserCartBox cartItemBox,
    required ProductRepository productRepository,
  })  : _cartItemBox = cartItemBox,
        _productRepository = productRepository;

  final UserCartBox _cartItemBox;
  final ProductRepository _productRepository;

  /// Get all cart items
  Future<List<CartItem>> getCartItems() async {
    try {
      return _cartItemBox.values.toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCartItemsFailure(error), stackTrace);
    }
  }

  /// Clear all cart items
  Future<void> clearCart() async {
    try {
      await _cartItemBox.clear();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ClearCartFailure(error), stackTrace);
    }
  }

  Future<CartItem> createCurrent({required String productUuid}) async {
    try {
      if (_cartItemBox.containsKey(productUuid)) {
        return _cartItemBox.get(productUuid)!;
      } else {
        final product = await _productRepository.getProductDetails(
          uuid: productUuid,
          hasSimilar: false,
        );
        log('----------Create current product : $product--------------------');
        final price = product!.price!;
        final discount = product.discounts;
        final photos = product.photo;
        final cartItem = CartItem(
          uuid: productUuid,
          quantity: 1,
          size: '',
          creator: product.creator?.uuid ?? '',
          price: discount == null ? price : discount.discountedPrice!,
          nameTk: product.name?.tm ?? '',
          nameRu: product.name?.ru ?? '',
          photoPath: (photos == null || photos.isEmpty)
              ? 'INVALID_PHOTO'
              : photos.first.path!,
        );
        return cartItem;
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(CreateCurrentFailure(error), stackTrace);
    }
  }

  /// Add a new cart item based on the productUuid
  Future<void> addCartItem(CartItem cartItem) async {
    try {
      if (cartItem.quantity == 0) {
        await _cartItemBox.delete(cartItem.uuid);
      }
      await _cartItemBox.put(cartItem.uuid, cartItem);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartItemFailure(error), stackTrace);
    }
  }
}
