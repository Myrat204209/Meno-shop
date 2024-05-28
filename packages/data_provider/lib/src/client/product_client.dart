import 'package:data_provider/data_provider.dart';

class ProductClient {
  final Http _http;

  ProductClient({required Http http}) : _http = http;
  Future<ProductListResponse> getProducts([
    GetProductListQueryParameters? queryParameters,
  ]) async {
    final response = await _http.get<JsonType>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );
    return ProductListResponse.fromJson(response.data!);
  }
}
