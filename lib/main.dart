import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app_state.dart';
import 'app.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider( // 테마 Provider
            create: (context) => ThemeProvider(context),
          ),
          ChangeNotifierProvider( // 바텀 네비게이션 Provider
            create: (context) => NavigationProvider(),
          ),
        ],
      child: const MyApp(),
    )

  );
}
