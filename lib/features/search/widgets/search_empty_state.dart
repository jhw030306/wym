import 'package:flutter/material.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "검색어를 입력해주세요",
        style: TextStyle(color: Colors.white54, fontSize: 16),
      ),
    );
  }
}
