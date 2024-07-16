import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/favorite/favorite_page.dart';
import 'package:test_project/map/map_home.dart';
import 'package:test_project/mypage/my_page.dart';
import 'package:test_project/order/order_list.dart';
import 'package:test_project/test_search.dart';
import 'package:test_project/theme/theme.dart';
import 'app_state.dart';
import 'home.dart';
import 'login/login_page.dart';
import 'login/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',

      theme: themeProvider.lightTheme, // 라이트 테마
      darkTheme: themeProvider.darkTheme, // 다크 테마
      themeMode: themeProvider.themeMode, // 테마 모드 저장해 뒀다가 다시 킬때 사용

      initialRoute: '/login', // 시작 페이지를 / (MyHomePage로. 추후 스플래시 페이지로 바꾸고 로그인되있으면 바로 홈으로 넘어가는 플로우 구성)

      routes: { // route를 /를 통해 웹사이트 처럼 지정.
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const MyHomePage(title: "title"),
        '/login/sign': (BuildContext context) => const SignUpPage(),
        '/map': (BuildContext context) => const MapHomePage(),
        '/mypage': (BuildContext context) => const MyPage(),
        '/order': (BuildContext context) => const OrderListPage(),
        '/favorite': (BuildContext context) => const FavoritePage(),
        '/search': (BuildContext context) => SearchPage(title: '',),
      },
    );
  }
}