import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return SearchBar(
          controller: this.controller,
          hintText: 'Search...',
          leading: Icon(Icons.search, color: Colors.white),
          trailing: [
            IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                this.controller.clear();
              },
            ),
          ],
          overlayColor: const WidgetStatePropertyAll(Colors.grey),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          backgroundColor: WidgetStatePropertyAll(Colors.teal[700]),
          elevation: const WidgetStatePropertyAll(5.0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          ListTile(
            title: const Text("123"),
            onTap: () {
              controller.closeView("123");
            },
          ),
          ListTile(
            title: const Text("1234"),
            onTap: () {
              controller.closeView("1234");
            },
          ),
        ];
      },
    );
  }
}