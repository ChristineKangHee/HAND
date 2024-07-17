import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/my_promocard.dart';
import 'package:test_project/theme/theme.dart';
import 'package:test_project/components/my_appbar.dart';
import 'package:test_project/components/my_button.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/theme/font.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

import 'app_state.dart';
import 'components/my_divider.dart';
import 'components/my_searchbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    //////////////////////////////////////////////////////////////////////
    ///////                      카테고리 항목들                       ///////
    //////////////////////////////////////////////////////////////////////

    final List<Map<String, String>> categories = [
      {"image": "assets/images/category_1.png", "label": "과일"},
      {"image": "assets/images/category_2.png", "label": "채소"},
      {"image": "assets/images/category_3.png", "label": "제과/제빵"},
      {"image": "assets/images/category_4.png", "label": "반찬"},
      {"image": "assets/images/category_5.png", "label": "조리식품"},
      {"image": "assets/images/category_6.png", "label": "유제품"},
      {"image": "assets/images/category_7.png", "label": "쌀/잡곡"},
      {"image": "assets/images/category_8.png", "label": "축/수산물"},
      {"image": "assets/images/category_9.png", "label": "조미료"},
      {"image": "assets/images/category_10.png", "label": "기타"},
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
        titleSpacing: 0,
      ),

      //////////////////////////////////////////////////////////////////////
      ///////                         Body                           ///////
      //////////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchWidget(items: items)
            ),

            //////////////////////////////////////////////////////////////////////
            ///////                         배너                            ///////
            //////////////////////////////////////////////////////////////////////
            SizedBox(height: 34,),

            CarouselSlider(
              options: CarouselOptions(
                height: 200.h,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: [
                const PromoCard(
                  gradientColors: [Color(0xFFFFD8A3), Color(0xFFF5A536)],
                  title: '아이스크림\n파격 할인 30%\n놓치지 마세요!',
                  buttonText: '주문하기',
                  lottieUrl: "https://lottie.host/6a682ede-1f46-44fc-8c85-4ea0b68576e8/ih5hsHubop.json",
                  imageWidth: 156,
                  imageHeight: 233,
                ),
                const PromoCard(
                  gradientColors: [Color(0xFF97C5FF), Color(0xFF006FFD)],
                  title: '내 지역 근방에서 \n구매할 수 있는 \n식품 리스트를 알아보세요!',
                  buttonText: '알아보기',
                  lottieUrl: "https://lottie.host/3b1e833e-da6d-4687-beb5-3450848c1e59/8emL58pguN.json",
                  imageWidth: 96,
                  imageHeight: 144,
                ),
                const PromoCard(
                  gradientColors: [Color(0x3872B75A), Color(0xFF72B75A)],
                  title: 'ZERO가 HAND 앱을 통해\n이뤄낸 환경 지키기 발걸음!\n함께 할까요?',
                  buttonText: '함께하기',
                  lottieUrl: "https://lottie.host/f9f831e3-b11e-469d-9ca0-2e65fda09785/e0YTsf253L.json",
                  imageWidth: 118,
                  imageHeight: 177,
                ),
              ].map((card) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: card,
                    );
                  },
                );
              }).toList(),
            ),

            //////////////////////////////////////////////////////////////////////
            ///////                        카테고리                          ///////
            //////////////////////////////////////////////////////////////////////
            SizedBox(height: 34,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('카테고리', style: pretendardBold(context)),
                  SizedBox(height: 8),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    children: List.generate(categories.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index]["image"]!,
                            width: 32.w,
                            height: 38.h,
                          ),
                          SizedBox(height: 4),
                          Text(
                            categories[index]["label"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1C1C20),
                              fontSize: 14,
                              fontFamily: 'Pretendard Variable',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),

            //////////////////////////////////////////////////////////////////////
            ///////                      맞춤 추천 가게                       ///////
            //////////////////////////////////////////////////////////////////////
            SizedBox(height: 36,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('제로님을 위한 맞춤 추천 가게', style: pretendardBold(context),),
                  const SizedBox(height: 8),
                  Container(
                    width: 1.sw,
                    height: 180.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(4, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 165.w,
                              height: 130.h,
                              margin: EdgeInsets.only(right: 8),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset('assets/images/recommendation_${index + 1}.png',
                                    fit: BoxFit.cover,
                                  ), // 추천 가게 이미지
                                ),
                              ),
                            ),
                            Text("수월경화", style: pretendardSemiBold(context).copyWith(fontSize: 14),),
                            Row(
                              children: [
                                Text("1.0 km • ", style: pretendardRegularSecond(context).copyWith(fontSize: 12),),
                                Icon(Icons.star_rounded, color: Colors.yellow[700], size: 16,),
                                Text("5.0", style: pretendardBold(context).copyWith(fontSize: 12),),
                                Text(" (4,130)", style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12),),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            //////////////////////////////////////////////////////////////////////
            ///////                      Top 3 랭킹                         ///////
            //////////////////////////////////////////////////////////////////////
            SizedBox(height: 46,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,4,0),
                        child: Text('HAND Top 3 랭킹', style: pretendardBold(context)),
                      ),
                      Icon(Icons.info, color: Theme.of(context).colorScheme.outline, size: 15,),
                      Expanded(
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: (){/* 여기에 navigator */},
                                child: Text("모두 보기", style: pretendardSemiBoldSecond(context).copyWith(fontSize: 15),
                                ),
                              )
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: List.generate(3, (index) {
                      final place = [
                      {"name": "덕수파스타 포항 양덕점", "rating": "5.0", "reviews": "15,250", "distance": "1.7km", "image": 'assets/images/ranking_1.png'},
                      {"name": "비건베이커리", "rating": "4.5", "reviews": "2,901", "distance": "1.2km", "image": 'assets/images/ranking_2.png'},
                      {"name": "윰포레스트", "rating": "4.8", "reviews": "1,596", "distance": "2.6km", "image": 'assets/images/ranking_3.png'}
                      ][index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Image.asset('assets/images/medal_${index + 1}.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  place['image']!,
                                  fit: BoxFit.cover,
                                  width: 84,
                                  height: 84,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(place['name']!, style: pretendardBold(context),),
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded, color: Colors.yellow[700], size: 16,),
                                    Text(place['rating']!, style: pretendardBold(context).copyWith(fontSize: 12),),
                                    Text(' (${place['reviews']!})', style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12),),
                                  ],
                                ),
                                Text('양식 • 양덕동 • ${place['rating']!}', style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12),),
                              ]
                            ),
                          ],
                        )
                      );
                    }),
                  ),
                ],
              ),
            ),

            //////////////////////////////////////////////////////////////////////
            ///////                      테마 변경 버튼                       ///////
            //////////////////////////////////////////////////////////////////////

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



