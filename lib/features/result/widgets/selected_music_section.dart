import 'package:flutter/material.dart';

class SelectedMusicSection extends StatelessWidget {
  final String title;
  final String artist;
  final String image;

  const SelectedMusicSection({
    super.key,
    required this.title,
    required this.artist,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
