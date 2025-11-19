import 'package:flutter/material.dart';
import '../../../core/services/chart_service.dart';

class CountryChartSection extends StatefulWidget {
  final String selectedCountry;

  const CountryChartSection({super.key, required this.selectedCountry});

  @override
  State<CountryChartSection> createState() => _CountryChartSectionState();
}

class _CountryChartSectionState extends State<CountryChartSection> {
  List<dynamic> tracks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadChart();
  }

  Future<void> loadChart() async {
    try {
      final data = await ChartService.fetchTopTracks(widget.selectedCountry);
      setState(() {
        tracks = data;
        loading = false;
      });
    } catch (e) {
      print("차트 로딩 오류: $e");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "인기 차트",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        ...tracks.take(10).map((track) {
          return ListTile(
            leading: Image.network(
              track["thumbnail"],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              track["track_name"],
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              track["artist_name"],
              style: const TextStyle(color: Colors.grey),
            ),
          );
        }),
      ],
    );
  }
}
