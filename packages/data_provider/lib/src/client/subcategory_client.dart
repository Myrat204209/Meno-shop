import 'package:data_provider/data_provider.dart';

class SubcategoryClient {
  SubcategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<List<SubcategoryItem>?> getSubcategories([
    GetSubcategoryQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/subcategories',
      queryParameters: queryParameters?.toJson(),
    );

    List<SubcategoryItem>? subcategories;
    subcategories = response.data!
        .map((subcategory) => SubcategoryItem.fromJson(subcategory))
        .toList();
    return subcategories;
  }

  Future<List<ProductItem>?> getSubcategoryProducts([
    GetSubcategoryQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/products',
      queryParameters: queryParameters?.toJson(),
    );

    List<ProductItem>? products;
    products =
        response.data!.map((product) => ProductItem.fromJson(product)).toList();
    return products;
  }
}
