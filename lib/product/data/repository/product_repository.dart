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

class GetOneProductFailure extends ProductFailure {
  const GetOneProductFailure(super.error);
}

class GetFavoritesFailure extends ProductFailure {
  const GetFavoritesFailure(super.error);
}

class FavoritePressedFailure extends ProductFailure {
  const FavoritePressedFailure(super.error);
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
  Future<ProductItem?> getProductByUuid({
    required String uuid,
  }) async {
    try {
      return await _productClient.getProductByUuid(uuid: uuid);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetOneProductFailure(error), stackTrace);
    }
  }

  bool isFavorite(String productUuid) {
    try {
      return _userFavoritesBox.containsKey(productUuid);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  ///Local method to fetch favorites.
  Future<List<ProductItem>?> getProductsList() async {
    try {
      final favoriteList = _userFavoritesBox.values.toList();
      return await _productClient.getProductsList(uuids: favoriteList);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFavoritesFailure(error), stackTrace);
    }
  }

  Future<void> favoritePressed(String productUuid) async {
    try {
      if (_userFavoritesBox.containsKey(productUuid)) {
        await _userFavoritesBox.delete(productUuid);
      } else {
        await _userFavoritesBox.put(productUuid, productUuid);
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FavoritePressedFailure(error), stackTrace);
    }
  }
}
