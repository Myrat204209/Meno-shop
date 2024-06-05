import 'package:data_provider/data_provider.dart';

class ProductClient {
  final Http _httpClient;

  ProductClient({
    required Http httpClient,
  }) : _httpClient = httpClient;
  Future<ProductListResponse> getProducts([
    GetQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<JsonType>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );
    return ProductListResponse.fromJson(response.data!);
  }
}
