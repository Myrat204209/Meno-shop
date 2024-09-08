import 'package:data_provider/data_provider.dart';

/// Auth client
class AuthClient {
  final Http _http;
  final TokenStorage _tokenStorage;

  AuthClient({
    required Http httpClient,
    required TokenStorage tokenStorage,
  })  : _http = httpClient,
        _tokenStorage = tokenStorage;

  /// Log In endpoints using phone
  Future<AuthResponse> auth(AuthRequestBody body) async {
    final response = await _http.post<JsonType>(
      '/auth',
      data: body.toJson(),
    );
    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(response.data!);
      final token = authResponse.token;
      if (token != null) {
        await _tokenStorage.saveToken(token);
      }
      return authResponse;
    } else
      throw (Exception(response.data?['message']));
  }

  Future<void> sendOtp({
    required AuthRequestBody sendOtpbody,
  }) async {
    await _http.get<JsonType>(
      '/auth/sendOtp',
      queryParameters: sendOtpbody.toJson(),
    );
  }

  Future<void> checkOtp({
    required AuthRequestBody checkOtpbody,
  }) async {
    await _http.get<JsonType>(
      '/auth/checkOtp',
      queryParameters: checkOtpbody.toJson(),
    );
  }

  // Future<User> getMe() async {
  //   final response = await _http.get<JsonType>('/user/me');
  //   final userToken = await _tokenStorage.readToken();
  //   if (response.statusCode == 200) {
  //     return User.fromJson(response.data!);
  //   } else {
  //     return User.anonymous(userId: userToken);
  //   }
  // }

  // Future<User> putMe({
  //   required UserRequestBody userBody,
  // }) async {
  //   final response = await _http.put<JsonType>(
  //     '/user/me',
  //     data: userBody.toJson(),
  //   );
  //   return User.fromJson(response.data!);
  // }

  ///Log out
  Future<void> logOut({String? deviceToken}) async {
    await _tokenStorage.clearToken();
  }
}
