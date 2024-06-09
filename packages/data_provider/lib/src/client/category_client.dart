import 'dart:developer';

import 'package:data_provider/data_provider.dart';

class CategoryClient {
  CategoryClient({
    required Http httpClient,
  }) : _httpClient = httpClient;

  final Http _httpClient;
  Future<List<CategoryItem>?> getCategories([
    GetQueryParameters? queryParameters,
  ]) async {
    final response = await _httpClient.get<List<dynamic>>(
      '/categories',
      queryParameters: queryParameters?.toJson(),
      // queryParameters: {
      //   'populate': [
      //     'photo',
      //   ],
      // }
    );

    // log('''My Json Response looks like this: ${response.data.toString()}
    //       Type of Json Response is like this ${response.data.runtimeType}\n
    // ''');

    // log('Response result: ${response.data}');
    List<CategoryItem>? categories;
    Iterable? jsonList = response.data as Iterable?;
    // log(response.data!.map(toElement));
    if (jsonList != null) {
      categories = jsonList
          .map((json) => CategoryItem.fromJson(json))
          .toList(); // Mapping JSON to CategoryItem objects
    } else {
      log('Response data is null or not iterable');
    }

    log('Category result: $categories');
    return categories;
  }
}
