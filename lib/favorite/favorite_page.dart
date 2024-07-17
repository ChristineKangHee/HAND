import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/components/my_placewidget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<bool> _isFavorited = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관심매장', style: pretendardSemiBold(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaceWidget(
                name: "덕수파스타 포항 양덕점",
                rating: "5.0",
                reviews: "15,250",
                distance: "1.7km",
                foodtype: '양식',
                specificlocation: '양덕동',
                image: 'assets/images/ranking_1.png',
                isFavorited: _isFavorited[0],
                onFavoriteToggle: () {
                  setState(() {
                    _isFavorited[0] = !_isFavorited[0];
                  });
                },
              ),
              PlaceWidget(
                name: "비건베이커리",
                rating: "4.5",
                reviews: "2,901",
                distance: "1.2km",
                foodtype: '양식',
                specificlocation: '양덕동',
                image: 'assets/images/ranking_2.png',
                isFavorited: _isFavorited[1],
                onFavoriteToggle: () {
                  setState(() {
                    _isFavorited[1] = !_isFavorited[1];
                  });
                },
              ),
              PlaceWidget(
                name: "윰포레스트",
                rating: "4.8",
                reviews: "1,596",
                distance: "2.6km",
                foodtype: '양식',
                specificlocation: '양덕동',
                image: 'assets/images/ranking_3.png',
                isFavorited: _isFavorited[2],
                onFavoriteToggle: () {
                  setState(() {
                    _isFavorited[2] = !_isFavorited[2];
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
