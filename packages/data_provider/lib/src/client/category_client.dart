import 'package:data_provider/data_provider.dart';

class CategoryClient {
  CategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<CategoryListResponse> getCategories() async {
    final response = await _httpClient.get<JsonType>('/categories');
    return CategoryListResponse.fromJson(response.data!);
  }
}
