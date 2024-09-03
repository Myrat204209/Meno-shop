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

  Future<ProductItem> getProductsByUuid({
    required String uuid,
  }) async {
    final response = await _httpClient.get<dynamic>(
      '/products/$uuid',
    );

    final product = ProductItem.fromJson(response.data);

    return product;
  }
}
