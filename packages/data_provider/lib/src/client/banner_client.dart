import 'package:data_provider/data_provider.dart';

class BannerClient {
  const BannerClient({
    required Http httpClient,
  }) : _http = httpClient;

  final Http _http;

  Future<List<BannerItem>> getBanners() async {
    final response = await _http.get<List<dynamic>>('/banners');
    final List<BannerItem>? banners;

    banners =
        response.data!.map((banner) => BannerItem.fromJson(banner)).toList();

    return banners;
  }
}
