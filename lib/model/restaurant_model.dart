// restaurant_model.dart

import 'package:test_project/model/restaurant.dart';

class RestaurantModel {
  final List<Restaurant> restaurants;

  RestaurantModel({required List<bool> isFavorited})
      : restaurants = [
    Restaurant(
      name: "덕수파스타 포항 양덕점",
      rating: "5.0",
      reviews: "15,250",
      distance: "1.7km",
      foodtype: '양식',
      specificlocation: '양덕동',
      image: 'assets/images/ranking_1.png',
      isFavorited: isFavorited[0],
    ),
    Restaurant(
      name: "비건베이커리",
      rating: "4.5",
      reviews: "2,901",
      distance: "1.2km",
      foodtype: '양식',
      specificlocation: '양덕동',
      image: 'assets/images/ranking_2.png',
      isFavorited: isFavorited[1],
    ),
    Restaurant(
      name: "윰포레스트",
      rating: "4.8",
      reviews: "1,596",
      distance: "2.6km",
      foodtype: '양식',
      specificlocation: '양덕동',
      image: 'assets/images/ranking_3.png',
      isFavorited: isFavorited[2],
    ),
  ];
}
