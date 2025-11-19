import 'package:wym/core/services/http_client.dart';

class FeatureService {
  static Future<Map<String, dynamic>> getAudioFeatures(String trackId) async {
    final data = await HttpClient.get("/audio-features/2takcwOaAZWiXQijPHIx7B");
    return data;
  }
}
