import 'package:data_provider/data_provider.dart';

class CategoryClient {
  CategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<List<CategoryItem>?> getCategories([
    GetProductListQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/categories',
      queryParameters: queryParameters?.toJson(),
    );

    List<CategoryItem>? categories;
    categories = response.data!
        .map((category) => CategoryItem.fromJson(category))
        .toList();
    return categories;
  }
}
