import 'package:data_provider/data_provider.dart' show Http, Profile, JsonType;

class ProfileClient {
  final Http _http;

  ProfileClient({required Http http}) : _http = http;
  Future<Profile> getMe() async {
    final response = await _http.get<JsonType>('/user');
    return Profile.fromJson(response.data!);
  }
}
