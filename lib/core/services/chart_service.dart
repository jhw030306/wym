import 'dart:convert';
import 'package:http/http.dart' as http;

class ChartService {
  static const String apiKey =
      "4c367ddb78msh67ad68c86a58666p1a5bfdjsnd8b0532a7971"; // ← 여기에 넣기
  static const String host = "spotify-scraper.p.rapidapi.com";

  static Future<List<dynamic>> fetchTopTracks(String countryCode) async {
    final url = Uri.parse("https://$host/v1/chart/tracks?region=$countryCode");

    final response = await http.get(
      url,
      headers: {"X-RapidAPI-Key": apiKey, "X-RapidAPI-Host": host},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["tracks"];
    } else {
      print("차트 API 오류: ${response.statusCode}");
      throw Exception("API 오류");
    }
  }
}
