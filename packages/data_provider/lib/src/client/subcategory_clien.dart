import 'package:data_provider/data_provider.dart';

class SubcategoryClient {
  SubcategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<List<SubcategoryItem>?> getSubcategories([
    GetQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/subcategories',
      queryParameters: queryParameters?.toJson(),
    );

    List<SubcategoryItem>? categories;
    categories = response.data!
        .map((category) => SubcategoryItem.fromJson(category))
        .toList();
    return categories;
  }
}
