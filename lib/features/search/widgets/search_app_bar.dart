import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final Future<void> Function() onSearch;

  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: TextField(
        controller: widget.controller,
        autofocus: true,
        style: const TextStyle(color: Colors.white),

        onChanged: (value) async {
          if (value.trim().isNotEmpty) {
            await widget.onSearch();
          }
          setState(() {});
        },

        onSubmitted: (_) => widget.onSearch(),

        decoration: InputDecoration(
          hintText: "노래 검색",
          hintStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,

          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    widget.controller.clear();
                    setState(() {});

                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: widget.onSearch,
        ),
      ],
    );
  }
}
