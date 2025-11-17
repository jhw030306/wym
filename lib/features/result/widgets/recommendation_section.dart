import 'package:flutter/material.dart';

class RecommendationSection extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onSelectionChanged;

  const RecommendationSection({super.key, required this.onSelectionChanged});

  @override
  State<RecommendationSection> createState() => _RecommendationSectionState();
}

class _RecommendationSectionState extends State<RecommendationSection> {
  List<Map<String, dynamic>> recommendations = [
    {"title": "Ditto", "artist": "NewJeans", "image": "", "selected": false},
    {"title": "Love Dive", "artist": "IVE", "image": "", "selected": false},
    {
      "title": "Attention",
      "artist": "NewJeans",
      "image": "",
      "selected": false,
    },
  ];

  bool selectAll = false;

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      for (var item in recommendations) {
        item["selected"] = selectAll;
      }
    });

    widget.onSelectionChanged(
      recommendations.where((item) => item["selected"]).toList(),
    );
  }

  void toggleItem(int index, bool? value) {
    setState(() {
      recommendations[index]["selected"] = value ?? false;

      selectAll = recommendations.every((item) => item["selected"] == true);
    });

    widget.onSelectionChanged(
      recommendations.where((item) => item["selected"]).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "비슷한 분위기의 추천곡",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Text("전체선택", style: TextStyle(color: Colors.white70)),
                  Checkbox(
                    value: selectAll,
                    onChanged: toggleSelectAll,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            final item = recommendations[index];

            return ListTile(
              leading: Checkbox(
                value: item["selected"],
                onChanged: (value) => toggleItem(index, value),
                activeColor: Colors.white,
                checkColor: Colors.black,
              ),

              title: Text(
                item["title"],
                style: const TextStyle(color: Colors.white),
              ),

              subtitle: Text(
                item["artist"],
                style: const TextStyle(color: Colors.white70),
              ),

              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: item["image"].isEmpty
                    ? const Icon(Icons.music_note, color: Colors.white70)
                    : Image.network(item["image"], fit: BoxFit.cover),
              ),

              onTap: () {
                toggleItem(index, !item["selected"]);
              },
            );
          },
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
