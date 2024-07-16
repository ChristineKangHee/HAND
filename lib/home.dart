import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/components/my_appbar.dart';
import 'package:test_project/components/my_button.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/theme/font.dart';

import 'app_state.dart';
import 'components/my_divider.dart';
import 'components/my_searchbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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

    // 개별 device 의 width, height 설정
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(Icons.location_on_outlined),
        title: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("현재 위치", style: pretendardLightLast(context),),
              Text("포항시 북구 흥해읍", style: pretendardBold(context),),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchWidget(items: items)
            ),
            Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset('assets/images/banner.png'), // 광고 배너 이미지
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('카테고리', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    children: List.generate(10, (index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.category),
                          ),
                          SizedBox(height: 4),
                          Text('카테고리 ${index + 1}', style: TextStyle(fontSize: 12)),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('제로님을 위한 맞춤 추천 가게', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(2, (index) {
                        return Container(
                          width: 300,
                          margin: EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset('assets/images/recommendation_${index + 1}.png'), // 추천 가게 이미지
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top 3 랭킹', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Column(
                    children: List.generate(3, (index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Text('${index + 1}', style: TextStyle(color: Colors.white)),
                        ),
                        title: Text('덕수파스타 포항 양덕점'),
                        subtitle: Text('5.0 (1) 양식 - 양덕동 - 1.7km'),
                        trailing: Image.asset('assets/images/ranking_${index + 1}.png', width: 50), // 랭킹 이미지
                      );
                    }),
                  ),
                ],
              ),
            ),
            BigDivider(),
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
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final List<String> items;

  const SearchWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        showSearch(
          context: context,
          delegate: MySearchDelegate(items),
        );
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        prefixIcon: Icon(Icons.search),
        labelText: '메뉴, 가게 이름 검색',
      ),
    );
  }
}