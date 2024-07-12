import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/components/my_appbar.dart';
import 'package:test_project/components/my_button.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/theme/font.dart';

import 'app_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // appBar: CustomAppBar(
      //   title: '매장 목록',
      //   onSearchPressed: () {
      //     print("검색");
      //   },
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardBlack(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardExtraBold(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardBold(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardSemiBold(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardMedium(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardRegular(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardLight(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardExtraLight(context),
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Text(
                  '한국어 TEST',
                  style: pretendardThin(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  function: () {
                    print("Button pressed");
                  },
                  title: 'Custom Button',
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
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