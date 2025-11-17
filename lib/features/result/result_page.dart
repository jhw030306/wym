import 'package:flutter/material.dart';

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
        title: const Text("분위기 분석", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 선택한 노래 표시
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white12,
                    ),
                    child: image.isEmpty
                        ? const Icon(Icons.music_note, color: Colors.white)
                        : Image.network(image, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            // Mood 분석 결과 (placeholder)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Mood 분석 결과",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            Container(
              height: 150,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Mood 분석 그래프",
                style: TextStyle(color: Colors.white70),
              ),
            ),

            // 추천 결과 자리
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "비슷한 분위기의 추천곡",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            Container(
              height: 200,
              color: Colors.white10,
              alignment: Alignment.center,
              child: const Text(
                "추천 리스트",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
