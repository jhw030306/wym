import 'package:flutter/material.dart';
import '../../core/services/lastfm_client.dart';
import '../../shared/models/music_model.dart';
import 'widgets/search_app_bar.dart';
import 'widgets/search_empty_state.dart';
import 'widgets/search_result_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  List<MusicModel> searchResults = [];

  Future<void> _onSearch() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      searchResults = [];
    });

    try {
      final data = await LastFmClient.get({
        "method": "track.search",
        "track": query,
        "limit": "20",
      });

      final matches = data["results"]["trackmatches"]["track"] as List;

      searchResults = matches.map((item) {
        return MusicModel(
          id: item["mbid"] ?? "",
          title: item["name"] ?? "",
          artist: item["artist"] ?? "",
          imageUrl: (item["image"]?[1]?["#text"] ?? ""),
        );
      }).toList();
    } catch (e) {
      print("검색 에러: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: SearchAppBar(controller: _controller, onSearch: _onSearch),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : searchResults.isEmpty
          ? SearchEmptyState()
          : SearchResultList(results: searchResults),
    );
  }
}
