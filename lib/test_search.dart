import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Search Bar Example'),
      ),
      body: Center(
        child: SearchAnchor(
          builder: (context, controller) {
            return SearchBar(
              controller: _textEditingController,
              hintText: 'Search...',
              leading: Icon(Icons.search, color: Colors.white),
              trailing: [
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
              ],
              overlayColor: const WidgetStatePropertyAll(Colors.grey),
              onChanged: (String value) {
                print('Search query: $value');
              },
              onSubmitted: (String value) {
                print('Submitted query: $value');
              },
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
                title: const Text("추천검색어1"),
                onTap: () {
                  controller.closeView("추천검색어1");
                },
              ),
              ListTile(
                title: const Text("추천검색어2"),
                onTap: () {
                  controller.closeView("추천검색어2");
                },
              ),
            ];
          },
        ),
      ),
    );
  }
}