import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';

import '../storedetail/store_detail.dart';

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
    return Material(
      // Material widget for InkWell behavior
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to StoreDetailPage on tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreDetailPage(name: name), // Pass necessary parameters
            ),
          );
        },
        child: Padding(
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
                    Text('$foodtype • $specificlocation • $distance', style: pretendardSemiBoldSecond(context).copyWith(fontSize: 12)),
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
        ),
      ),
    );
  }
}
