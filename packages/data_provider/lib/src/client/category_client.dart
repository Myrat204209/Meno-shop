import 'package:data_provider/data_provider.dart';

class CategoryClient {
  CategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<List<CategoryItem>?> getCategories([
    GetQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<JsonType>(
      '/categories',
      queryParameters: queryParameters?.toJson(),
    );
    Iterable jsonList = response.data as Iterable;
    List<CategoryItem> categories = List<CategoryItem>.from(
        jsonList.map((model) => CategoryItem.fromJson(model)));
    return categories;
  }
}
