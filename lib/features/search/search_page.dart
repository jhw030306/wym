import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, String>> searchResults = [];

  void _onSearch() {
    setState(() {
      searchResults = [
        {"title": "영웅", "artist": "NCT 127", "image": ""},
        {"title": "Chewing Gum", "artist": "NCT dream", "image": ""},
        {"title": "Ditto", "artist": "NewJeans", "image": ""},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "노래 검색",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _onSearch,
          ),
        ],
      ),
      body: searchResults.isEmpty ? _buildEmptyState() : _buildSearchResults(),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        "검색어를 입력해주세요",
        style: TextStyle(color: Colors.white54, fontSize: 16),
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final item = searchResults[index];

        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.music_note, color: Colors.white70),
          ),
          title: Text(
            item["title"]!,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            item["artist"]!,
            style: const TextStyle(color: Colors.white70),
          ),
          onTap: () {},
        );
      },
    );
  }
}
