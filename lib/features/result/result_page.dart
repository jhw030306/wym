import 'package:flutter/material.dart';
import 'widgets/selected_music_section.dart';
import 'widgets/mood_section.dart';
import 'widgets/recommendation_section.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final String artist;
  final String image;

  const ResultPage({
    super.key,
    required this.title,
    required this.artist,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("검색 결과", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectedMusicSection(title: title, artist: artist, image: image),
            const MoodSection(),
            const RecommendationSection(),
          ],
        ),
      ),
    );
  }
}
