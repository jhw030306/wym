import 'package:flutter/material.dart';
import '../../../shared/models/music_model.dart';
import '../../result/result_page.dart';

class SearchResultTile extends StatelessWidget {
  final MusicModel item;

  const SearchResultTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white12,
          image: item.imageUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(item.imageUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: item.imageUrl.isEmpty
            ? const Icon(Icons.music_note, color: Colors.white70)
            : null,
      ),
      title: Text(item.title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        item.artist,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ResultPage(item: item)),
        );
      },
    );
  }
}
