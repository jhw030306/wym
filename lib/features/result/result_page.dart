import 'package:flutter/material.dart';
import '../../shared/models/music_model.dart';
import '../search/search_page.dart';
import 'widgets/selected_music_section.dart';
import 'widgets/mood_section.dart';
import 'widgets/recommendation_section.dart';
import 'widgets/platform_buttons_section.dart';

class ResultPage extends StatefulWidget {
  final MusicModel item;

  const ResultPage({super.key, required this.item});

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.item.title, // 👈 반드시 widget.item
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchPage()),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectedMusicSection(
              title: widget.item.title,
              artist: widget.item.artist,
              image: widget.item.imageUrl,
            ),

            MoodSection(item: widget.item),

            RecommendationSection(onSelectionChanged: updateSelectedSongs),

            if (selectedSongs.isNotEmpty) const PlatformButtonsSection(),
          ],
        ),
      ),
    );
  }
}
