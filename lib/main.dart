import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app_state.dart';
import 'app.dart';
import 'theme/theme.dart';

void main() {
  //////////////////// 가로 모드 금지 ////////////////////
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider( // 테마 Provider / app_state.dart 존재
            create: (context) => ThemeProvider(context),
          ),
          ChangeNotifierProvider( // 바텀 네비게이션 Provider / app_state.dart 존재
            create: (context) => NavigationProvider(),
          ),
        ],
      child: const MyApp(),
    )

  );
}
