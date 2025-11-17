import 'package:flutter/material.dart';

class PlatformButtonsSection extends StatelessWidget {
  const PlatformButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "외부 음악 플랫폼에서 듣기",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _PlatformButton("Melon", Colors.green),
              _PlatformButton("Apple Music", Colors.red),
              _PlatformButton("YouTube Music", Colors.white),
              _PlatformButton("FLO", Colors.blue),
              _PlatformButton("Genie", Colors.lightBlueAccent),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlatformButton extends StatelessWidget {
  final String label;
  final Color color;

  const _PlatformButton(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
        color: color.withOpacity(0.1),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
