import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import '../components/my_divider.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1634560604992-7784a29bc419?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Theme.of(context).colorScheme.surface),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite_border, color: Theme.of(context).colorScheme.surface),
                            SizedBox(width: 10),
                            Icon(Icons.shopping_cart_outlined, color: Theme.of(context).colorScheme.surface),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 170,),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '포항시 북구 양덕동',
                            style: pretendardMedium(context).copyWith(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '양덕동 마카롱',
                            style: pretendardSemiBold(context).copyWith(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.star_rounded, color: Colors.yellow[700], size: 16),
                              SizedBox(width: 5),
                              Text(
                                '5.0',
                                style: pretendardSemiBold(context).copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '/ 116개의 리뷰',
                                style: pretendardMedium(context).copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          SmallDivider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time_rounded, color: Theme.of(context).colorScheme.secondary),
                              SizedBox(width: 6),
                              Text(
                                '영업중',
                                style: pretendardMedium(context).copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '오늘 09:30 ~ 20:00',
                                style: pretendardMedium(context).copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}