import 'package:flutter/material.dart';
import 'package:wym/features/home/widgets/history_section.dart';
import 'widgets/section_title.dart';
import 'widgets/mood_section.dart';
import 'widgets/popular_section.dart';
import 'widgets/country_chart_section.dart';

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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitle("오늘의 Mood 추천"),
            MoodSection(),

            SectionTitle("내 추천 기록"),
            HistorySection(),

            SectionTitle("인기 음악"),
            PopularSection(),

            SectionTitle("나라별 차트"),
            CountryChartSection(),
          ],
        ),
      ),
    );
  }
}
