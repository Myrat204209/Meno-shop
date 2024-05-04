import 'dart:developer';

import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';

/// Authentication client
class AuthenticationClient {
  final Http _http;
  final TokenStorage _tokenStorage;

  AuthenticationClient({
    required Http httpClient,
    required TokenStorage tokenStorage,
  })  : _http = httpClient,
        _tokenStorage = tokenStorage;

  //TODO: Change password
  /// Fetch user endpoint using JWT token

  Future<AuthenticationUser> getUser() async {
    final token = await _tokenStorage.readToken();
    log('----getUser-------Access token $token-----------------');
    final response = await _http.get<dynamic>(
      '/api/v1/user/getUser',
      options: Options(
        headers: {
          'authorization': 'Bearer $token',
        },
        validateStatus: (status) => token != null,
      ),
    );
    final authUser =
        AuthenticationUser.fromJson(response.data as Map<String, dynamic>);
    return authUser;
  }

  /// Register endpoints using phone and name and username
  Future<AuthResponse> register({
    required String name,
    required String surname,
    required String phone,
  }) async {
    final response = await _http.post<dynamic>(
      '/api/v1/auth/register',
      data: {
        'name': name,
        'surname': surname,
        'phone': phone,
      },
    );
    final authResponse =
        AuthResponse.fromJson(response.data as Map<String, dynamic>);
    log('-----register authResponse- ${authResponse}');

    final token = authResponse.token;
    if (token != null) {
      await _tokenStorage.saveToken(token);
    }
    return authResponse;
  }

  /// Log In endpoints using phone
  Future<AuthResponse> logIn({
    required String phone,
  }) async {
    final response = await _http.post<dynamic>(
      '/api/v1/auth/login',
      data: {
        'phone': phone,
      },
    );
    final authResponse =
        AuthResponse.fromJson(response.data as Map<String, dynamic>);
    log('-----login authResponse- ${authResponse}');
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
