import 'package:data_provider/data_provider.dart';

class ProductClient {
  ProductClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;

  Future<List<ProductItem>?> getProducts([
    GetProductQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );
    final List<ProductItem>? products;

    products =
        response.data!.map((json) => ProductItem.fromJson(json)).toList();

    return products;
  }

  Future<List<ProductItem>?> getFavorites({
    required List<String> favoritesUuid,
  }) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/favorites',
    );
    final List<ProductItem>? products =
        response.data!.map((json) => ProductItem.fromJson(json)).toList();

    return products;
  }

  Future<ProductItem?> getProductByUuid({
    required String uuid,
  }) async {
    final response = await _httpClient.get<dynamic>(
      '/products/$uuid',
      queryParameters: {'hasSimilar': true},
    );
    final product = ProductItem.fromJson(response.data);

    return product;
  }
}
