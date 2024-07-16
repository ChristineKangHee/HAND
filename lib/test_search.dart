import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/components/my_appbar.dart';
import 'package:test_project/components/my_button.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/theme/font.dart';

import 'components/my_searchbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final items = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry',
      'Fig',
      'Grape',
      'Honeydew',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: '매장 목록',
        onSearchPressed: () {
          showSearch(
            context: context,
            delegate: MySearchDelegate(items),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 나머지 코드 생략...
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text('Toggle Theme'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}