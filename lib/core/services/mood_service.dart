import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class MoodService {
  static Future<Map<String, dynamic>?> analyzeMood(
    String title,
    String artist,
  ) async {
    final url = Uri.https(
      AppConfig.rapidApiHost, // track-analysis.p.rapidapi.com
      "/metadata",
      {"track": title, "artist": artist},
    );

    final response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key": AppConfig.rapidApiKey,
        "X-RapidAPI-Host": AppConfig.rapidApiHost,
      },
    );

    // 🔥 여기가 중요! API가 실패하거나 성공하는지 보여줌
    print("📡 Mood API status: ${response.statusCode}");
    print("📡 Mood API body: ${response.body}");

    if (response.statusCode != 200) {
      return null;
    }

    final jsonData = json.decode(response.body);

    if (jsonData["data"] == null) return null;

    return jsonData["data"];
  }
}

class MoodService {
  static Future<Map<String, dynamic>?> analyzeMood(
    String title,
    String artist,
  ) async {
    final url = Uri.https(
      AppConfig.rapidApiHost, // track-analysis.p.rapidapi.com
      "/metadata",
      {"track": title, "artist": artist},
    );

    final response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key": AppConfig.rapidApiKey,
        "X-RapidAPI-Host": AppConfig.rapidApiHost,
      },
    );

    // 🔥 여기가 중요! API가 실패하거나 성공하는지 보여줌
    print("📡 Mood API status: ${response.statusCode}");
    print("📡 Mood API body: ${response.body}");

    if (response.statusCode != 200) {
      return null;
    }

    final jsonData = json.decode(response.body);

    if (jsonData["data"] == null) return null;

    return jsonData["data"];
  }
}

class MoodService {
  static Future<Map<String, dynamic>?> analyzeMood(
    String title,
    String artist,
  ) async {
    final url = Uri.https(
      AppConfig.rapidApiHost, // track-analysis.p.rapidapi.com
      "/metadata",
      {"track": title, "artist": artist},
    );

    final response = await http.get(
      url,
      headers: {
        "X-RapidAPI-Key": AppConfig.rapidApiKey,
        "X-RapidAPI-Host": AppConfig.rapidApiHost,
      },
    );

    // 🔥 여기가 중요! API가 실패하거나 성공하는지 보여줌
    print("📡 Mood API status: ${response.statusCode}");
    print("📡 Mood API body: ${response.body}");

    if (response.statusCode != 200) {
      return null;
    }

    final jsonData = json.decode(response.body);

    if (jsonData["data"] == null) return null;

    return jsonData["data"];
  }
}
