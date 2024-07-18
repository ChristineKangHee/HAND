// favorite_page.dart

import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/components/my_placewidget.dart';
import 'package:test_project/model/restaurant.dart';
import 'package:test_project/model/restaurant_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<bool> _isFavorited = [false, false, false];
  late RestaurantModel _restaurantModel;

  @override
  void initState() {
    super.initState();
    _restaurantModel = RestaurantModel(isFavorited: _isFavorited);
  }

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
            children: _restaurantModel.restaurants.asMap().entries.map((entry) {
              int index = entry.key;
              Restaurant restaurant = entry.value;
              return PlaceWidget(
                restaurant: restaurant,
                onFavoriteToggle: () {
                  setState(() {
                    _isFavorited[index] = !_isFavorited[index];
                    _restaurantModel = RestaurantModel(isFavorited: _isFavorited);
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
