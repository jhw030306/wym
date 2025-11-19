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

  /// 🔥 토큰 요청 (POST + Basic Auth)
  static Future<void> _getToken() async {
    final credentials = "${AppConfig.clientId}:${AppConfig.clientSecret}";
    final encoded = base64.encode(utf8.encode(credentials));

    final response = await http.post(
      Uri.parse(AppConfig.authUrl),
      headers: {
        "Authorization": "Basic $encoded",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"grant_type": "client_credentials"},
    );

    print("TOKEN RESPONSE: ${response.body}");

    final data = json.decode(response.body);

    _accessToken = data["access_token"];
    final int expiresIn = data["expires_in"];
    _tokenExpireTime = DateTime.now().add(Duration(seconds: expiresIn));
  }

  /// 🔥 실제 GET 요청
  static Future<dynamic> get(String path, {Map<String, String>? params}) async {
    if (_accessToken.isEmpty || _isTokenExpired) {
      await _getToken();
    }

    if (path.startsWith("/")) {
      path = path.substring(1);
    }

    final uri = Uri.parse(
      AppConfig.baseUrl + path,
    ).replace(queryParameters: params);

    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $_accessToken",
        "Accept": "application/json", // 🔥 추가된 부분
      },
    );

    if (response.statusCode != 200) {
      print("요청 URL: $uri");
      print("토큰: $_accessToken");
      throw Exception("API 요청 실패: ${response.statusCode}");
    }

    return json.decode(response.body);
  }
}
