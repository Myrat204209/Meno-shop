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
  }) : _productClient = productClient;

  final ProductClient _productClient;

  Future<List<ProductItem>?> getProducts([
    GetProductListQueryParameters? queryParameters,
  ]) async {
    try {
      return await _productClient.getProducts(queryParameters);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetProductsFailure(error), stackTrace);
    }
  }
}
