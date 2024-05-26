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

  /// Register endpoints using phone and name and username
  Future<AuthResponse> register(RegisterRequestBody body) async {
    final response = await _http.post<JsonType>(
      '/auth/register',
      data: body.toJson(),
    );
    final authResponse = AuthResponse.fromJson(response.data!);

    final token = authResponse.token;
    if (token != null) {
      await _tokenStorage.saveToken(token);
    }
    return authResponse;
  }

  /// Log In endpoints using phone
  Future<AuthResponse> login(LoginRequestBody body) async {
    final response = await _http.post<JsonType>(
      'auth/login',
      data: body.toJson(),
    );
    final authResponse = AuthResponse.fromJson(response.data!);
    final token = authResponse.token;
    if (token != null) {
      await _tokenStorage.saveToken(token);
    }
    return authResponse;
  }

  Future<AuthResponse> sendOtp(AuthOtpBody body) async {
    final response = await _http.post<JsonType>(
      'auth/sendOtp',
      data: body.toJson(),
    );
    final authResponse = AuthResponse.fromJson(response.data!);
    final token = authResponse.token;
    if (token != null) {
      await _tokenStorage.saveToken(token);
    }
    return authResponse;
  }

  Future<dynamic> checkOtp(AuthOtpBody body) async {
    final response = await _http.post<JsonType>(
      'auth/checkOtp',
      data: body.toJson(),
    );
    final authResponse = AuthResponse.fromJson(response.data!);
    final token = authResponse.token;
    if (token != null) {
      await _tokenStorage.saveToken(token);
    }
    return authResponse;
  }

  ///Log out
  Future<void> logOut({String? deviceToken}) async {
    await _tokenStorage.clearToken();
  }
}
