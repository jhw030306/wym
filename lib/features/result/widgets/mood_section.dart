import 'package:flutter/material.dart';
import '../../../core/services/mood_service.dart';
import '../../../shared/models/music_model.dart';

class MoodSection extends StatefulWidget {
  final MusicModel item;
  const MoodSection({super.key, required this.item});

  @override
  State<MoodSection> createState() => _MoodSectionState();
}

class _MoodSectionState extends State<MoodSection> {
  Map<String, dynamic>? mood;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadMood();
  }

  Future<void> loadMood() async {
    final data = await MoodService.analyzeMood(
      widget.item.title,
      widget.item.artist,
    );

    setState(() {
      mood = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (mood == null) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Mood 정보를 찾을 수 없습니다.",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mood 분석",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 16),

          Info("Tempo", mood!["tempo"].toString()),
          Info("Energy", mood!["energy"].toString()),
          Info("Danceability", mood!["danceability"].toString()),
          Info("Valence", mood!["valence"].toString()),
          Info("Acousticness", mood!["acousticness"].toString()),
          Info("Instrumentalness", mood!["instrumentalness"].toString()),
          Info("Mood", mood!["mood"].toString()),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String label;
  final String value;

  const Info(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
