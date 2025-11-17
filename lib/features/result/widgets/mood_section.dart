import 'package:flutter/material.dart';

class MoodSection extends StatelessWidget {
  const MoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
