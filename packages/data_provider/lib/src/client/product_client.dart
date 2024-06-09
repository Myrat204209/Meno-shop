import 'dart:developer';

import 'package:data_provider/data_provider.dart';

class ProductClient {
  ProductClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;

  Future<List<ProductItem>?> getProducts([
    GetProductListQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );
    List<ProductItem>? products;
    Iterable? jsonList = response.data as Iterable?;
    // log(response.data!.map(toElement));
    if (jsonList != null) {
      products = jsonList
          .map((json) => ProductItem.fromJson(json))
          .toList(); // Mapping JSON to CategoryItem objects
    } else {
      log('Response data is null or not iterable');
    }
    return products;
  }
}
