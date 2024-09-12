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

  Future<List<ProductItem>?> getProductsList({
    required List<String> uuids,
  }) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/products/list',
      data: {'uuids': uuids},
    );
    final List<ProductItem>? products =
        response.data!.map((json) => ProductItem.fromJson(json)).toList();

    return products;
  }

  Future<ProductItem?> getProductDetails({
    required String uuid,
    bool hasSimilar = true,
  }) async {
    final response = await _httpClient.get<dynamic>(
      '/products/$uuid',
      queryParameters: {'hasSimilar': hasSimilar},
    );
    final product = ProductItem.fromJson(response.data);

    return product;
  }
}
