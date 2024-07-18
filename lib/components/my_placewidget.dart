import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';

class PlaceWidget extends StatelessWidget {
  final String name;
  final String rating;
  final String reviews;
  final String distance;
  final String image;
  final String specificlocation;
  final String foodtype;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const PlaceWidget({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.image,
    required this.specificlocation,
    required this.foodtype,
    required this.isFavorited,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 84,
                height: 84,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: pretendardBold(context)),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow[700], size: 16),
                    Text(rating, style: pretendardBold(context).copyWith(fontSize: 12)),
                    Text(' ($reviews)', style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12)),
                  ],
                ),
                Text('양식 • 양덕동 • $distance', style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Theme.of(context).colorScheme.primary : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
    );
  }
}