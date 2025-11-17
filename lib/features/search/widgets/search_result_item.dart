import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final String title;
  final String artist;
  final VoidCallback onTap;

  const SearchResultItem({
    super.key,
    required this.title,
    required this.artist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), subtitle: Text(artist), onTap: onTap);
  }
}
