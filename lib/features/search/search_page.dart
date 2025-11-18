import 'package:flutter/material.dart';
import '../../core/services/http_client.dart';
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
      final data = await HttpClient.get(
        "/search",
        params: {"q": query, "type": "track", "limit": "20"},
      );

      final items = data["tracks"]["items"] as List;

      searchResults = items.map((item) => MusicModel.fromJson(item)).toList();
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
