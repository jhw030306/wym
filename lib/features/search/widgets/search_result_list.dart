import 'package:flutter/material.dart';
import '../../../shared/models/music_model.dart';
import 'package:wym/features/search/widgets/search_result_tile.dart';

class SearchResultList extends StatelessWidget {
  final List<MusicModel> results;

  const SearchResultList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return SearchResultTile(item: results[index]);
      },
    );
  }
}
