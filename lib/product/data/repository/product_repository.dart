import 'package:equatable/equatable.dart';
import 'package:data_provider/data_provider.dart';

/// A base failure for the product repository failures
abstract class ProductFailure with EquatableMixin implements Exception {
  const ProductFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetProductsFailure extends ProductFailure {
  const GetProductsFailure(super.error);
}

class GetFavoritesFailure extends ProductFailure {
  const GetFavoritesFailure(super.error);
}

class AddFavoriteFailure extends ProductFailure {
  const AddFavoriteFailure(super.error);
}

class RemoveFavoriteFailure extends ProductFailure {
  const RemoveFavoriteFailure(super.error);
}

class ProductRepository {
  const ProductRepository({
    required ProductClient productClient,
    required UserFavoritesBox userFavoritesBox,
  })  : _userFavoritesBox = userFavoritesBox,
        _productClient = productClient;

  /// Remote method to get products.
  final ProductClient _productClient;

  /// Local method to get favorite products.
  final UserFavoritesBox _userFavoritesBox;

  /// Remote method to get  products.
  Future<List<ProductItem>?> getProducts([
    GetProductQueryParameters? queryParameters,
  ]) async {
    try {
      return await _productClient.getProducts(queryParameters);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductsFailure(error), stackTrace);
    }
  }

  /// Remote method to get  products by uuid.
  Future<ProductItem?> getProductsByUuid({
    required String uuid,
  }) async {
    try {
      return await _productClient.getProductsByUuid(uuid: uuid);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductsFailure(error), stackTrace);
    }
  }

  Future<bool> isFavorite(ProductItem product) async {
    try {
      return _userFavoritesBox.containsKey(product.uuid);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  ///Local method to fetch favorites.
  Future<List<ProductItem>> getFavorites() async {
    try {
      return _userFavoritesBox.values.toList();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFavoritesFailure(error), stackTrace);
    }
  }

  Future<void> addFavorite(ProductItem product) async {
    try {
      await _userFavoritesBox.put(product.uuid, product);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AddFavoriteFailure(error), stackTrace);
    }
  }

  Future<void> removeFavorite(ProductItem product) async {
    try {
      await _userFavoritesBox.delete(product.uuid);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(RemoveFavoriteFailure(error), stackTrace);
    }
  }
}
