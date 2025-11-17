import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "WYM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: 검색 페이지로 이동
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("오늘의 Mood 추천"),
            _moodSection(),

            _sectionTitle("인기 음악"),
            _popularSection(),

            _sectionTitle("나라별 차트"),
            _countryChartSection(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Mood 추천 섹션
  Widget _moodSection() {
    final moods = ["Chill", "Happy", "Energetic", "Sad"];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: moods.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                moods[index],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }

  // 인기 음악 섹션
  Widget _popularSection() {
    final items = List.generate(10, (index) => "곡 $index");

    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.music_note, color: Colors.white, size: 32),
                const SizedBox(height: 8),
                Text(items[index], style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }

  // 나라별 차트 섹션
  Widget _countryChartSection() {
    final countries = ["한국", "일본", "미국", "영국"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 드롭다운
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<String>(
            dropdownColor: Colors.grey[900],
            value: countries.first,
            items: countries
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(c, style: const TextStyle(color: Colors.white)),
                  ),
                )
                .toList(),
            onChanged: (v) {},
          ),
        ),

        // 리스트
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.music_note, color: Colors.white),
              title: Text(
                "차트 곡 $index",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "아티스트",
                style: TextStyle(color: Colors.white70),
              ),
            );
          },
        ),
      ],
    );
  }
}
