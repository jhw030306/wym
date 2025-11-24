import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class LastFmClient {
  static Future<dynamic> get(Map<String, String> params) async {
    final uri = Uri.parse(AppConfig.lastFmBaseUrl).replace(
      queryParameters: {
        ...params,
        "api_key": AppConfig.lastFmApiKey,
        "format": "json",
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Last.fm API 오류: ${response.statusCode}");
    }

    return json.decode(response.body);
  }
}
