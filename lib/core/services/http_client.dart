import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class HttpClient {
  static String _accessToken = "";
  static DateTime? _tokenExpireTime;

  static bool get _isTokenExpired {
    if (_tokenExpireTime == null) return true;
    return DateTime.now().isAfter(_tokenExpireTime!);
  }

  static Future<void> _getToken() async {
    final credentials = "${AppConfig.clientId}:${AppConfig.clientSecret}";
    final encoded = base64Url.encode(utf8.encode(credentials));

    final response = await http.post(
      Uri.parse(AppConfig.authUrl),
      headers: {
        "Authorization": "Basic $encoded",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"grant_type": "client_credentials"},
    );

    final data = json.decode(response.body);

    _accessToken = data["access_token"];
    final int expiresIn = data["expires_in"];

    _tokenExpireTime = DateTime.now().add(Duration(seconds: expiresIn));
  }

  static Future<dynamic> get(String url, {Map<String, String>? params}) async {
    if (_accessToken.isEmpty || _isTokenExpired) {
      await _getToken();
    }

    final uri = Uri.parse(
      "${AppConfig.baseUrl}$url",
    ).replace(queryParameters: params);

    final response = await http.get(
      uri,
      headers: {"Authorization": "Bearer $_accessToken"},
    );

    if (response.statusCode != 200) {
      throw Exception("API 요청 실패: ${response.statusCode}");
    }

    return json.decode(response.body);
  }
}
