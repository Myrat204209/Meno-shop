import 'package:data_provider/data_provider.dart'
    show
        GetSubcategoryQueryParameters,
        ProductItem,
        SubcategoryClient,
        SubcategoryItem;
import 'package:equatable/equatable.dart';

/// A base failure for the subcategory repository failures
abstract class SubcategoryFailure with EquatableMixin implements Exception {
  const SubcategoryFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetSubcategoryListFailure extends SubcategoryFailure {
  const GetSubcategoryListFailure(super.error);
}

class GetSubcategoryProductsFailure extends SubcategoryFailure {
  const GetSubcategoryProductsFailure(super.error);
}

class SubcategoryRepository {
  const SubcategoryRepository({
    required SubcategoryClient subcategoryClient,
  }) : _subcategoryClient = subcategoryClient;

  final SubcategoryClient _subcategoryClient;

  Future<List<SubcategoryItem>?> getSubcategories(
      [GetSubcategoryQueryParameters? queryParameters]) async {
    try {
      return await _subcategoryClient.getSubcategories(queryParameters);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetSubcategoryListFailure(error), stackTrace);
    }
  }

  Future<List<ProductItem>?> getSubcategoryProducts(
      [GetSubcategoryQueryParameters? queryParameters]) async {
    try {
      return await _subcategoryClient.getSubcategoryProducts(queryParameters);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
          GetSubcategoryProductsFailure(error), stackTrace);
    }
  }
}
