import 'package:flutter/material.dart';
import 'widgets/selected_music_section.dart';
import 'widgets/mood_section.dart';
import 'widgets/recommendation_section.dart';

class ResultPage extends StatefulWidget {
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
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Map<String, dynamic>> selectedSongs = [];

  void updateSelectedSongs(List<Map<String, dynamic>> songs) {
    setState(() {
      selectedSongs = songs;
    });
    print("ResultPage에서 선택된 곡들: $selectedSongs");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectedMusicSection(
              title: widget.title,
              artist: widget.artist,
              image: widget.image,
            ),

            const MoodSection(),

            RecommendationSection(onSelectionChanged: updateSelectedSongs),
          ],
        ),
      ),
    );
  }
}
