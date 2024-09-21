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

class GetProductDetailsFailure extends ProductFailure {
  const GetProductDetailsFailure(super.error);
}

class GetProductsListFailure extends ProductFailure {
  const GetProductsListFailure(super.error);
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
  Future<ProductItem?> getProductDetails({
    required String uuid,
    bool hasSimilar = true,
  }) async {
    try {
      return await _productClient.getProductDetails(
        uuid: uuid,
        hasSimilar: hasSimilar,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductDetailsFailure(error), stackTrace);
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
  Future<List<ProductItem>?> getFavoritesList() async {
    try {
      final productsList = _userFavoritesBox.keys.cast<String>().toList();
      return await _productClient.getProductsList(uuids: productsList);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFavoritesFailure(error), stackTrace);
    }
  }

  ///Local method to fetch favorites.
  Future<List<ProductItem>?> getProductsList({required List<String> uuids}) async {
    try {
      return await _productClient.getProductsList(uuids: uuids);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductsListFailure(error), stackTrace);
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
