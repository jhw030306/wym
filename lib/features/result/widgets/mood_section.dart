import 'package:flutter/material.dart';
import '../../../core/services/feature_service.dart';
import '../../../shared/models/music_model.dart';

class MoodSection extends StatefulWidget {
  final MusicModel item;
  const MoodSection({super.key, required this.item});

  @override
  State<MoodSection> createState() => _MoodSectionState();
}

class _MoodSectionState extends State<MoodSection> {
  Map<String, dynamic>? moodData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMood();
  }

  Future<void> _loadMood() async {
    try {
      final data = await FeatureService.getAudioFeatures(widget.item.id);

      setState(() {
        moodData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Mood API 오류: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (moodData == null) {
      return const Text(
        "Mood 데이터를 불러올 수 없습니다.",
        style: TextStyle(color: Colors.white),
      );
    }

    final energy = (moodData!["energy"] * 100).toInt();
    final valence = (moodData!["valence"] * 100).toInt();
    final dance = (moodData!["danceability"] * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Mood 분석",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),

        MoodBar(label: "에너지", value: energy),
        MoodBar(label: "밝기(Valence)", value: valence),
        MoodBar(label: "댄스성", value: dance),
      ],
    );
  }
}

class MoodBar extends StatelessWidget {
  final String label;
  final int value;

  const MoodBar({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text("$value%", style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
