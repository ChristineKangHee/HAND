import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/app_state.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  /*
  사용 방법
  Scaffold 에서 아래와 같이 사용

  bottomNavigationBar: const CustomNavigationBar(),
   */

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationProvider.selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
      unselectedItemColor: Colors.grey,
      onTap: (index) => navigationProvider.navigateToIndex(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_rounded),
          label: '관심매장',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: '지도',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_rounded),
          label: '주문내역',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: '마이페이지',
        ),
      ],
    );
  }
}