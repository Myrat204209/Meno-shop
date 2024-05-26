import 'package:data_provider/data_provider.dart'
    show JsonType, CartResponse, Http;
import 'package:data_provider/src/models/cart_update_request_body/cart_update_request_body.dart';

class CartClient {
  const CartClient({
    required Http httpClient,
  }) : _http = httpClient;
  final Http _http;
  Future<CartResponse> getCart() async {
    final response = await _http.get<JsonType>('/carts');
    return CartResponse.fromJson(response.data!);
  }

  Future<CartResponse> updateCart(CartUpdateRequestBody body) async {
    final response = await _http.post<JsonType>(
      '/carts',
      data: body.toJson(),
    );
    return CartResponse.fromJson(response.data!);
  }
}
