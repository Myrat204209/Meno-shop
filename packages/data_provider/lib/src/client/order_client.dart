import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';

class OrderClient {
  const OrderClient({
    required Http httpClient,
  }) : _httpClient = httpClient;
  final Http _httpClient;

  Future<dynamic> submitOrder(OrderItem body) async {
      final response = await _httpClient.post<JsonType>(
        '/orders',
        data: FormData.fromMap(body.toJson()),
      );
      return response.data;

  }
}
