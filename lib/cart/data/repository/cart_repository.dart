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

  /// Add a new cart item based on the productUuid
  Future<void> addCartItem(String productUuid) async {
    try {
      final product = await _productRepository.getProductDetails(
        uuid: productUuid,
        hasSimilar: false,
      );
      final price = product!.price!;
      final discount = product.discounts;
      final cartItem = CartItem(
        uuid: productUuid,
        quantity: 1,
        size: '',
        creator: product.creator?.uuid ?? '',
        price: discount == null ? price : discount.discountedPrice!,
      );

      // Check if the item already exists
      if (_cartItemBox.containsKey(productUuid)) {
        final existingCartItem = _cartItemBox.get(productUuid);
        final updatedCartItem = existingCartItem!.copyWith(
          quantity: existingCartItem.quantity + 1,
        );
        await _cartItemBox.put(productUuid, updatedCartItem);
      } else {
        await _cartItemBox.put(productUuid, cartItem);
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartItemFailure(error), stackTrace);
    }
  }

  /// Update the quantity of an existing cart item
  Future<void> updateCartItemQuantity(String productUuid, int quantity) async {
    try {
      // Ensure the item exists in the cart, add if missing
      var cartItem = _cartItemBox.get(productUuid);
      if (cartItem == null) {
        await addCartItem(productUuid);
        cartItem = _cartItemBox.get(productUuid);
      }

      final updatedCartItem = cartItem!.copyWith(quantity: quantity);
      await _cartItemBox.put(productUuid, updatedCartItem);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          UpdateCartItemQuantityFailure(error), stackTrace);
    }
  }

  /// Update the size of an existing cart item
  Future<void> updateCartItemSize(String productUuid, String size) async {
    try {
      // Ensure the item exists in the cart, add if missing
      var cartItem = _cartItemBox.get(productUuid);
      if (cartItem == null) {
        await addCartItem(productUuid);
        cartItem = _cartItemBox.get(productUuid);
      }

      final updatedCartItem = cartItem!.copyWith(size: size);
      await _cartItemBox.put(productUuid, updatedCartItem);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(UpdateCartItemSizeFailure(error), stackTrace);
    }
  }
}
