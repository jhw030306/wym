import 'package:flutter/material.dart';

class CountryChartSection extends StatelessWidget {
  const CountryChartSection({super.key});

  @override
  Widget build(BuildContext context) {
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
